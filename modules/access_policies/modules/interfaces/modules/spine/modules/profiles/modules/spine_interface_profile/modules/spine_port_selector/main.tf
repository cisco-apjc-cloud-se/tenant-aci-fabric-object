terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_spine_access_port_selector" "selector" {
  spine_interface_profile_dn        = var.spine_interface_profile_dn
  name                              = var.port_selector.name
  spine_access_port_selector_type   = var.port_selector.spine_access_port_selector_type
  annotation                        = var.port_selector.annotation
  name_alias                        = var.port_selector.name_alias

  ### Policy Group Name ###
  relation_infra_rs_sp_acc_grp = var.port_selector.policy_group_name != null ? var.interface_policy_group_map[var.port_selector.policy_group_name].id : null

}

### NOTE: Uses access port block still ###
module "port_block" {
  for_each = var.port_selector.port_blocks
  source    = "./modules/port_block"

  ### VARIABLES ###
  access_port_selector_dn = aci_spine_access_port_selector.selector.id
  port_block              = each.value
}
