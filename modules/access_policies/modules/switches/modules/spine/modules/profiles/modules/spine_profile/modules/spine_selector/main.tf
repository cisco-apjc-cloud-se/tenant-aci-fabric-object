terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_spine_switch_association" "selector" {
  spine_profile_dn                = var.spine_profile_dn
  name                            = var.spine_selector.name
  description                     = var.spine_selector.description
  spine_switch_association_type   = var.spine_selector.spine_switch_association_type
  annotation                      = var.spine_selector.annotation
  name_alias                      = var.spine_selector.name_alias

  ### Policy Group Name ###
  relation_infra_rs_spine_acc_node_p_grp = var.spine_selector.policy_group_name != null ? var.switch_policy_group_map[var.spine_selector.policy_group_name].id : null
}

module "node_block" {
  for_each = var.spine_selector.node_blocks
  source = "./modules/node_block"

  ### VARIABLES ###
  switch_association_dn = aci_spine_switch_association.selector.id
  node_block            = each.value
}
