terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_access_port_selector" "selector" {
  leaf_interface_profile_dn = var.leaf_interface_profile_dn
  description               = var.port_selector.description
  name                      = var.port_selector.name
  access_port_selector_type = var.port_selector.access_port_selector_type
  annotation                = var.port_selector.annotation
  name_alias                = var.port_selector.name_alias

  ### Policy Group Name ###
  relation_infra_rs_acc_base_grp = var.port_selector.policy_group_name != null ? var.interface_policy_group_map[var.port_selector.policy_group_name].id : null
}

module "port_block" {
  for_each = var.interface_profile.port_blocks
  source = "./modules/port_block"

  ### VARIABLES ###
  access_port_selector_dn = aci_access_port_selector.selector.id
  port_block              = each.value
}

module "sub_port_block" {
  for_each = var.interface_profile.sub_port_blocks
  source = "./modules/sub_port_block"

  ### VARIABLES ###
  access_port_selector_dn = aci_access_port_selector.selector.id
  sub_port_block          = each.value
}
