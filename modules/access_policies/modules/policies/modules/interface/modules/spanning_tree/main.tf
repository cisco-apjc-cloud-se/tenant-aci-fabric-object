terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_spanning_tree_interface_policy" "stp" {
  name        = var.spanning_tree.name
  annotation  = var.spanning_tree.annotation
  description = var.spanning_tree.description
  name_alias  = var.spanning_tree.name_alias
  ctrl        = var.spanning_tree.ctrl
}
