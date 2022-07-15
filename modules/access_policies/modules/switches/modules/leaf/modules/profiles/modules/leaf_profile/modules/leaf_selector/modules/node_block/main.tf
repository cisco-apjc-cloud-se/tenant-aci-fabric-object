terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_node_block" "check" {
  switch_association_dn   = var.switch_association_dn
  name                    = var.node_block.name
  annotation              = var.node_block.annotation
  description             = var.node_block.description
  from_                   = var.node_block.from_node
  name_alias              = var.node_block.name_alias
  to_                     = var.node_block.to_node
}
