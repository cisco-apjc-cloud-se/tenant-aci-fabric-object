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
  fc_domain = defaults(var.fc_domain, {
    vlan_pool = {
      use_existing  = false
      alloc_mode    = "static" ## "dyanmic" or "static"
    }
    vsan_pool = {
      use_existing  = false
      alloc_mode    = "static" ## "dyanmic" or "static"
    }
  })
}

### Optionally load existing VLAN pool ###
data "aci_vlan_pool" "pool" {
  count = local.fc_domain.vlan_pool.use_existing == true ? 1 : 0
  name        = local.fc_domain.vlan_pool.name
  alloc_mode  = local.fc_domain.vlan_pool.alloc_mode
}

### Optionally load existing VSAN pool ###
data "aci_vsan_pool" "pool" {
  count = local.fc_domain.vsan_pool.use_existing == true ? 1 : 0
  name        = local.fc_domain.vlan_pool.name
  alloc_mode  = local.fc_domain.vlan_pool.alloc_mode
}

### Build new FC domain ###
resource "aci_fc_domain" "domain" {
  name                      = local.fc_domain.name
  annotation                = local.fc_domain.annotation
  name_alias                = local.fc_domain.name_alias

  ### VLAN Pool Mapping ###
  relation_infra_rs_vlan_ns           = local.fc_domain.vlan_pool.use_existing == true ? data.aci_vlan_pool.pool[0].id : var.vlan_pool_map[local.fc_domain.vlan_pool].id
  # relation_infra_rs_vlan_ns_def       = var.domain.name

  ### VSAN Pool Mapping ###
  relation_fc_rs_vsan_ns              = local.fc_domain.vsan_pool.use_existing == true ? data.aci_vsan_pool.pool[0].id : var.vsan_pool_map[local.fc_domain.vsan_pool].id
  # relation_fc_rs_vsan_ns_def - (Optional) Relation to class fvnsAVsanInstP. Cardinality - N_TO_ONE. Type - String.
  # relation_fc_rs_vsan_attr - (Optional) Relation to class fcVsanAttrP. Cardinality - N_TO_ONE. Type - String.
  # relation_fc_rs_vsan_attr_def - (Optional) Relation to class fcVsanAttrP. Cardinality - N_TO_ONE. Type - String.

  ### Unused ###
  # relation_infra_rs_vip_addr_ns - (Optional) Relation to class fvnsAddrInst. Cardinality - N_TO_ONE. Type - String.
  # relation_infra_rs_dom_vxlan_ns_def - (Optional) Relation to class fvnsAInstP. Cardinality - N_TO_ONE. Type - String.

}
