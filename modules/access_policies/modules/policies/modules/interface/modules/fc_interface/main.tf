terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_interface_fc_policy" "fc" {
  name         = var.fc_interface.name
  annotation   = var.fc_interface.annotation
  description  = var.fc_interface.description
  automaxspeed = var.fc_interface.automaxspeed
  fill_pattern = var.fc_interface.fill_pattern
  name_alias   = var.fc_interface.name_alias
  port_mode    = var.fc_interface.port_mode
  rx_bb_credit = var.fc_interface.rx_bb_credit
  speed        = var.fc_interface.speed
  trunk_mode   = var.fc_interface.trunk_mode
}
