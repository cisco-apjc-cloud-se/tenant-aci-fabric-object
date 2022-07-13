terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_l2_interface_policy" "l2" {
  name        = var.l2_interface.name
  annotation  = var.l2_interface.annotation
  description = var.l2_interface.description
  name_alias  = var.l2_interface.name_alias
  qinq        = var.l2_interface.qinq
  vepa        = var.l2_interface.vepa
  vlan_scope  = var.l2_interface.vlan_scope
}
