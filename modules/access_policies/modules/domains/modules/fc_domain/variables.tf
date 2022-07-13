variable "fc_domain" {
  type = object({
    name                                = string
    annotation                          = optional(string)
    name_alias                          = optional(string)
    vsan_pool                           = string
    vlan_pool                           = string
    # relation_infra_rs_vlan_ns - (Optional) Relation to class fvnsVlanInstP. Cardinality - N_TO_ONE. Type - String.
    # relation_fc_rs_vsan_ns - (Optional) Relation to class fvnsVsanInstP. Cardinality - N_TO_ONE. Type - String.
    # relation_fc_rs_vsan_attr - (Optional) Relation to class fcVsanAttrP. Cardinality - N_TO_ONE. Type - String.
    # relation_infra_rs_vlan_ns_def - (Optional) Relation to class fvnsAInstP. Cardinality - N_TO_ONE. Type - String.
    # relation_infra_rs_vip_addr_ns - (Optional) Relation to class fvnsAddrInst. Cardinality - N_TO_ONE. Type - String.
    # relation_infra_rs_dom_vxlan_ns_def - (Optional) Relation to class fvnsAInstP. Cardinality - N_TO_ONE. Type - String.
    # relation_fc_rs_vsan_attr_def - (Optional) Relation to class fcVsanAttrP. Cardinality - N_TO_ONE. Type - String.
    # relation_fc_rs_vsan_ns_def - (Optional) Relation to class fvnsAVsanInstP. Cardinality - N_TO_ONE. Type - String.
  })
}

variable "vlan_pool_map" {}

variable "vsan_pool_map" {}
