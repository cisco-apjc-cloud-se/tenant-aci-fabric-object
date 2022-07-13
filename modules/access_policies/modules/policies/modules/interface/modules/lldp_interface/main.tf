terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_lldp_interface_policy" "lldp" {
  description = var.lldp_interface.description
  name        = var.lldp_interface.name
  admin_rx_st = var.lldp_interface.admin_rx_st
  admin_tx_st = var.lldp_interface.admin_tx_st
  annotation  = var.lldp_interface.annotation
  name_alias  = var.lldp_interface.name_alias
}
