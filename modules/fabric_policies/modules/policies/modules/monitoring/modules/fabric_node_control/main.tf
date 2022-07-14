terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_fabric_node_control" "policy" {
  name        = var.fabric_node_control.name
  annotation  = var.fabric_node_control.annotation
  control     = var.fabric_node_control.control
  feature_sel = var.fabric_node_control.feature_sel
  name_alias  = var.fabric_node_control.name_alias
  description = var.fabric_node_control.description
}
