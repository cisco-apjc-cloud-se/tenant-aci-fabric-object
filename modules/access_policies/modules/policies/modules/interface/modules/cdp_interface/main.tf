terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_cdp_interface_policy" "cdp" {
  name        = var.cdp_interface.name
  admin_st    = var.cdp_interface.admin_st
  annotation  = var.cdp_interface.annotation
  name_alias  = var.cdp_interface.name_alias
  description = var.cdp_interface.description
}
