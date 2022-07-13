terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_physical_domain" "domain" {
  name                                = var.physical_domain.name
  annotation                          = var.physical_domain.annotation
  name_alias                          = var.physical_domain.name_alias

  ### VLAN Pool Mapping ###
  relation_infra_rs_vlan_ns           = var.vlan_pool_map[var.physical_domain.vlan_pool].id
  # relation_infra_rs_vlan_ns_def       = var.domain.name

  ### Unused ###
  # relation_infra_rs_vip_addr_ns       = var.domain.name
  # relation_infra_rs_dom_vxlan_ns_def  = var.domain.name
}
