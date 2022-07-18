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
  interface_profile = defaults(var.interface_profile, {
    use_existing = false
  })
}

### Optionally load existing interface profile ###
data "aci_spine_interface_profile" "profile" {
  count = local.interface_profile.use_existing == true ? 1 : 0
  name = local.interface_profile.name
}

### Optionally build new interface profile ###
resource "aci_spine_interface_profile" "profile" {
  count       = local.interface_profile.use_existing == true ? 1 : 0
  name        = local.interface_profile.name
  description = local.interface_profile.description
  annotation  = local.interface_profile.annotation
  name_alias  = local.interface_profile.name_alias
}

module "spine_port_selector" {
  for_each = local.interface_profile.port_selectors
  source = "./modules/spine_port_selector"

  ### VARIABLES ###
  spine_interface_profile_dn = local.interface_profile.use_existing == true ? data.aci_spine_interface_profile.profile[0].id : aci_spine_interface_profile.profile[0].id
  interface_policy_group_map = var.interface_policy_group_map
  port_selector              = each.value
}
