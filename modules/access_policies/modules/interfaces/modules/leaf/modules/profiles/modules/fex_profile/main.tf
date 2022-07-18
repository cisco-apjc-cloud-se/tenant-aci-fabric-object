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
  fex_profile = defaults(var.fex_profile, {
    use_existing = false
  })
}

### Optionally load existing interface profile ###
data "aci_fex_profile" "profile" {
  count = local.fex_profile.use_existing == true ? 1 : 0
  name = local.fex_profile.name
}

### Optionally build new interface profile ###
resource "aci_fex_profile" "profile" {
  count = local.fex_profile.use_existing == false ? 1 : 0
  name        = local.fex_profile.name
  annotation  = local.fex_profile.annotation
  name_alias  = local.fex_profile.name_alias
  description = local.fex_profile.description
}

module "access_port_selector" {
  for_each = local.fex_profile.port_selectors
  source = "./modules/access_port_selector"

  ### VARIABLES ###
  leaf_interface_profile_dn   = local.fex_profile.use_existing == true ? data.aci_fex_profile.profile[0].id : aci_fex_profile.profile[0].id
  interface_policy_group_map  = var.interface_policy_group_map
  port_selector               = each.value
}
