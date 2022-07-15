terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_ranges" "range" {
  vlan_pool_dn  = var.pool_dn
  description   = var.range.description
  from          = format("vsan-%d", var.range.from) #"vsan-1"
  to            = format("vsan-%d", var.range.to) #"vsan-2"
  alloc_mode    = var.range.alloc_mode
  annotation    = var.range.annotation
  name_alias    = var.range.name_alias
  role          = var.range.role
}
