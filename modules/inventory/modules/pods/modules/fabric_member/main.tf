terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_fabric_node_member" "node" {
  name        = var.fabric_member.name
  serial      = var.fabric_member.serial
  annotation  = var.fabric_member.annotation
  description = var.fabric_member.description
  ext_pool_id = var.fabric_member.ext_pool_id
  fabric_id   = var.fabric_member.fabric_id
  name_alias  = var.fabric_member.name_alias
  node_id     = var.fabric_member.node_id
  node_type   = var.fabric_member.node_type
  pod_id      = var.pod_id
  role        = var.fabric_member.role
}
