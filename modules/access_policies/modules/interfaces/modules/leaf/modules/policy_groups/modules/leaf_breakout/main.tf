terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_leaf_breakout_port_group" "group" {
  name        = var.breakout.name
  annotation  = var.breakout.annotation
  brkout_map  = var.breakout.brkout_map
  name_alias  = var.breakout.name_alias
  description = var.breakout.description

  ### Unused ###
  # relation_infra_rs_mon_brkout_infra_pol = var.breakout.name
}
