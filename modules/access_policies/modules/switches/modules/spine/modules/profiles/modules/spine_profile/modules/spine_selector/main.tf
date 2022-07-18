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
  spine_selector = defaults(var.spine_selector, {
    use_existing = false
  })
}

### Optionally load existing selector ###
data "aci_spine_switch_association" "selector" {
  count = local.spine_selector.use_existing == true ? 1 : 0
  spine_profile_dn                = var.spine_profile_dn
  name                            = local.spine_selector.name
  spine_switch_association_type   = "range"
}

### Optionally build new selector ###
resource "aci_spine_switch_association" "selector" {
  count = local.spine_selector.use_existing == false ? 1 : 0
  spine_profile_dn                = var.spine_profile_dn
  name                            = local.spine_selector.name
  description                     = local.spine_selector.description
  spine_switch_association_type   = local.spine_selector.spine_switch_association_type
  annotation                      = local.spine_selector.annotation
  name_alias                      = local.spine_selector.name_alias

  ### Policy Group Name ###
  relation_infra_rs_spine_acc_node_p_grp = local.spine_selector.policy_group.name != null ? (local.spine_selector.policy_group.use_existing == true ? data.aci_spine_switch_association.selector[0].id : var.switch_policy_group_map[local.spine_selector.policy_group.name].id) : null
}

module "node_block" {
  for_each = local.spine_selector.node_blocks
  source = "./modules/node_block"

  ### VARIABLES ###
  switch_association_dn = local.spine_selector.use_existing == true ? data.aci_spine_switch_association.selector[0].id : aci_spine_switch_association.selector[0].id
  node_block            = each.value
}
