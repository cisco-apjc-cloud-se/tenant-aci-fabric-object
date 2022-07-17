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
  l3_domain = defaults(var.l3_domain, {
    vlan_pool = {
      use_existing  = false
      alloc_mode    = "static" ## "dyanmic" or "static"
    }
  })
}

### Optionally load existing VLAN pool ###
data "aci_vlan_pool" "pool" {
  count = local.l3_domain.vlan_pool.use_existing == true ? 1 : 0
  name        = local.l3_domain.vlan_pool.name
  alloc_mode  = local.l3_domain.vlan_pool.alloc_mode
}

### Build new L3 domain ###
resource "aci_l3_domain_profile" "domain" {
  name                      = local.l3_domain.name
  annotation                = local.l3_domain.annotation
  name_alias                = local.l3_domain.name_alias

  ### VLAN Pool Mapping ###
  relation_infra_rs_vlan_ns = local.l3_domain.vlan_pool.use_existing == true ? data.aci_vlan_pool.pool[0].id : var.vlan_pool_map[local.l3_domain.vlan_pool].id
  # relation_infra_rs_vlan_ns_def

  ### Unused ###
  # relation_infra_rs_vip_addr_ns
  # relation_extnw_rs_out
  # relation_infra_rs_dom_vxlan_ns_def
}
