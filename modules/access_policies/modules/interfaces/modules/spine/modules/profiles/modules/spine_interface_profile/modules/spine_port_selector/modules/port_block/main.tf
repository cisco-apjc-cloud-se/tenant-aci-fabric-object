terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_access_port_block" "block" {
  access_port_selector_dn = var.access_port_selector_dn
  description             = var.port_block.description
  name                    = var.port_block.name
  annotation              = var.port_block.annotation
  from_card               = var.port_block.from_card
  from_port               = var.port_block.from_port
  name_alias              = var.port_block.name_alias
  to_card                 = var.port_block.to_card
  to_port                 = var.port_block.to_port
  # relation_infra_rs_acc_bndl_subgrp
}
