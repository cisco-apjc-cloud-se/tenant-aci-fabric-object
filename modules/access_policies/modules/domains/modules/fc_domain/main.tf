terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_fc_domain" "domain" {
  name                      = var.fc_domain.name
  annotation                = var.fc_domain.annotation
  name_alias                = var.fc_domain.name_alias

  ### VLAN Pool Mapping ###
  relation_infra_rs_vlan_ns           = var.vlan_pool_map[var.fc_domain.vlan_pool].id
  # relation_infra_rs_vlan_ns_def       = var.domain.name

  ### VSAN Pool Mapping ###
  relation_fc_rs_vsan_ns              = var.vsan_pool_map[var.fc_domain.vsan_pool].id
  # relation_fc_rs_vsan_ns_def - (Optional) Relation to class fvnsAVsanInstP. Cardinality - N_TO_ONE. Type - String.
  # relation_fc_rs_vsan_attr - (Optional) Relation to class fcVsanAttrP. Cardinality - N_TO_ONE. Type - String.
  # relation_fc_rs_vsan_attr_def - (Optional) Relation to class fcVsanAttrP. Cardinality - N_TO_ONE. Type - String.

  ### Unused ###
  # relation_infra_rs_vip_addr_ns - (Optional) Relation to class fvnsAddrInst. Cardinality - N_TO_ONE. Type - String.
  # relation_infra_rs_dom_vxlan_ns_def - (Optional) Relation to class fvnsAInstP. Cardinality - N_TO_ONE. Type - String.

}
