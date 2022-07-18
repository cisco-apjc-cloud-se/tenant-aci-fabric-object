terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

locals {
  leaf_selector = defaults(var.leaf_selector, {
    use_existing = false
    policy_group = {
      use_existing = false
    }
  })
}

### Optionally load existing selector ###
data "aci_leaf_selector" "selector" {
  count = local.leaf_selector.use_existing == true ? 1 : 0
  leaf_profile_dn         = var.leaf_profile_dn
  name                    = local.leaf_selector.name
  switch_association_type = "range"
}

### Optionally build new selector ###
resource "aci_leaf_selector" "selector" {
  count = local.leaf_selector.use_existing == false ? 1 : 0
  leaf_profile_dn         = var.leaf_profile_dn
  name                    = local.leaf_selector.name
  switch_association_type = local.leaf_selector.switch_association_type
  annotation              = local.leaf_selector.annotation
  description             = local.leaf_selector.description
  name_alias              = local.leaf_selector.name_alias

  ### Policy Group Name ###
  relation_infra_rs_acc_node_p_grp = local.leaf_selector.policy_group.name != null ? (local.leaf_selector.policy_group.use_existing == true ? data.aci_leaf_selector.selector[0].id : var.switch_policy_group_map[local.leaf_selector.policy_group.name].id) : null
}

module "node_block" {
  for_each = local.leaf_selector.node_blocks
  source = "./modules/node_block"

  ### VARIABLES ###
  switch_association_dn = local.leaf_selector.use_existing == true ? data.aci_leaf_selector.selector[0].id : aci_leaf_selector.selector[0].id
  node_block            = each.value
}
