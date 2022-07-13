terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_l3_domain_profile" "domain" {
  name                      = var.l3_domain.name
  annotation                = var.l3_domain.annotation
  name_alias                = var.l3_domain.name_alias

  ### VLAN Pool Mapping ###
  relation_infra_rs_vlan_ns = var.vlan_pool_map[var.l3_domain.vlan_pool].id
  # relation_infra_rs_vlan_ns_def

  ### Unused ###
  # relation_infra_rs_vip_addr_ns
  # relation_extnw_rs_out
  # relation_infra_rs_dom_vxlan_ns_def
}
