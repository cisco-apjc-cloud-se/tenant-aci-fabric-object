terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_lacp_policy" "pc" {
  name        = var.port_channel.name
  description = var.port_channel.description
  annotation  = var.port_channel.annotation
  ctrl        = var.port_channel.ctrl
  max_links   = var.port_channel.max_links
  min_links   = var.port_channel.min_links
  mode        = var.port_channel.mode
  name_alias  = var.port_channel.name_alias
}
