terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_leaf_selector" "selector" {
  leaf_profile_dn         = var.leaf_profile_dn
  name                    = var.leaf_selector.name
  switch_association_type = var.leaf_selector.switch_association_type
  annotation              = var.leaf_selector.annotation
  description             = var.leaf_selector.description
  name_alias              = var.leaf_selector.name_alias

  ### Policy Group Name ###
  relation_infra_rs_acc_node_p_grp = var.leaf_selector.policy_group_name != null ? var.switch_policy_group_map[var.leaf_selector.policy_group_name].id : null
}

module "node_block" {
  for_each = var.leaf_selector.node_blocks
  source = "./modules/node_block"

  ### VARIABLES ###
  switch_association_dn = aci_leaf_selector.selector.id
  node_block            = each.value
}
