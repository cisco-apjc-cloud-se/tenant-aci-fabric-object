variable "l3_domain" {
  type = object({
    name       = string
    annotation = optional(string)
    name_alias = optional(string)
    vlan_pool       = object({
      use_existing  = optional(bool)
      name          = string
      alloc_mode    = optional(string)
    })
    # relation_infra_rs_vlan_ns
    # relation_infra_rs_vlan_ns_def
    # relation_infra_rs_vip_addr_ns
    # relation_extnw_rs_out
    # relation_infra_rs_dom_vxlan_ns_def
  })
}

variable "vlan_pool_map" {}
