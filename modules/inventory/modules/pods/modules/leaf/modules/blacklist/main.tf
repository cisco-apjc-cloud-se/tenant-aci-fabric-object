terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  # experiments = [module_variable_optional_attrs]
}

resource "aci_interface_blacklist" "blacklist" {
  for_each = var.blacklist

  pod_id    = var.pod_id
  node_id   = var.node_id
  interface = each.value
}
