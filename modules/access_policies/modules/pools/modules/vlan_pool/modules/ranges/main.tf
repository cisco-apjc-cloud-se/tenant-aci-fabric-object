terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

locals {
  vlan_pool = defaults(var.vlan_pool, {
    use_existing = false
  })
}

resource "aci_ranges" "range" {
  vlan_pool_dn  = var.pool_dn
  description   = local.range.description
  from          = format("vlan-%d", local.range.from) #"vlan-1"
  to            = format("vlan-%d", local.range.to) #"vlan-2"
  alloc_mode    = local.range.alloc_mode
  annotation    = local.range.annotation
  name_alias    = local.range.name_alias
  role          = local.range.role
}
