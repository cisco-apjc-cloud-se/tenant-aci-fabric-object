terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}


resource "aci_spine_interface_profile" "profile" {
  name        = var.interface_profile.name
  description = var.interface_profile.description
  annotation  = var.interface_profile.annotation
  name_alias  = var.interface_profile.name_alias
}

module "spine_port_selector" {
  for_each = var.interface_profile.port_selectors
  source = "./modules/spine_port_selector"

  ### VARIABLES ###
  spine_interface_profile_dn = aci_spine_interface_profile.profile.id
  interface_policy_group_map = var.interface_policy_group_map
  port_selector              = each.value
}
