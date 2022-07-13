terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_fex_profile" "profile" {
  name        = var.fex_profile.name
  annotation  = var.fex_profile.annotation
  name_alias  = var.fex_profile.name_alias
  description = var.fex_profile.description
}
