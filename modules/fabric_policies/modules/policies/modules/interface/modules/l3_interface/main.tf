terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_l3_interface_policy" "policy" {
  name        = var.l3_interface.name
  annotation  = var.l3_interface.annotation
  bfd_isis    = var.l3_interface.bfd_isis
  name_alias  = var.l3_interface.name_alias
  description = var.l3_interface.description
}
