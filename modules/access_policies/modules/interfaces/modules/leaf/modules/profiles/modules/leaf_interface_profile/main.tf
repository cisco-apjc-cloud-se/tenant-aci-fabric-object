terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_leaf_interface_profile" "profile" {
  description = var.interface_profile.description
  name        = var.interface_profile.name
  annotation  = var.interface_profile.annotation
  name_alias  = var.interface_profile.name_alias
}

module "access_port_selector" {
  for_each = var.interface_profile.port_selectors
  source = "./modules/access_port_selector"

  ### VARIABLES ###
  leaf_interface_profile_dn   = aci_leaf_interface_profile.profile.id
  interface_policy_group_map  = var.interface_policy_group_map
  port_selector               = each.value
}
