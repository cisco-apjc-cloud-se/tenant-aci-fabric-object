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
  physical_domain = defaults(var.physical_domain, {
    vlan_pool = {
      use_existing  = false
      alloc_mode    = "static" ## "dyanmic" or "static"
    }
  })
}

### Optionally load existing VLAN pool ###
data "aci_vlan_pool" "pool" {
  count = local.physical_domain.vlan_pool.use_existing == true ? 1 : 0
  name        = local.physical_domain.vlan_pool.name
  alloc_mode  = local.physical_domain.vlan_pool.alloc_mode
}

### Build new physical domain ###
resource "aci_physical_domain" "domain" {
  name                                = local.physical_domain.name
  annotation                          = local.physical_domain.annotation
  name_alias                          = local.physical_domain.name_alias

  ### VLAN Pool Mapping ###
  relation_infra_rs_vlan_ns           = local.physical_domain.vlan_pool.use_existing == true ? data.aci_vlan_pool.pool[0].id : var.vlan_pool_map[local.physical_domain.vlan_pool.name].id
  # relation_infra_rs_vlan_ns_def       = var.domain.name

  ### Unused ###
  # relation_infra_rs_vip_addr_ns       = var.domain.name
  # relation_infra_rs_dom_vxlan_ns_def  = var.domain.name
}
