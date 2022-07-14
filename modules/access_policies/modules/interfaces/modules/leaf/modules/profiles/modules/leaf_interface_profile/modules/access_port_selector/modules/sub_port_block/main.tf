terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_access_sub_port_block" "block" {
  access_port_selector_dn = var.access_port_selector_dn
  description             = var.sub_port_block.description
  name                    = var.sub_port_block.name
  annotation              = var.sub_port_block.annotation
  from_card               = var.sub_port_block.from_card
  from_port               = var.sub_port_block.from_port
  from_sub_port           = var.sub_port_block.from_sub_port
  name_alias              = var.sub_port_block.name_alias
  to_card                 = var.sub_port_block.to_card
  to_port                 = var.sub_port_block.to_port
  to_sub_port             = var.sub_port_block.to_sub_port
}
