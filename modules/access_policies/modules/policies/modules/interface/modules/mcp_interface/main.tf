terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_miscabling_protocol_interface_policy" "mcp" {
  description = var.mcp_interface.description
  name        = var.mcp_interface.name
  admin_st    = var.mcp_interface.admin_st
  annotation  = var.mcp_interface.annotation
  name_alias  = var.mcp_interface.name_alias
}
