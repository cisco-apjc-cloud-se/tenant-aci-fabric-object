variable "physical_domain" {
  type = object({
    name       = string
    annotation = optional(string)
    name_alias = optional(string)
    vlan_pool  = object({
      use_existing  = optional(bool)
      name          = string
      alloc_mode    = optional(string)
    })
    # relation_infra_rs_vlan_ns           = var.domain.name
    # relation_infra_rs_vlan_ns_def       = var.domain.name
    # relation_infra_rs_vip_addr_ns       = var.domain.name
    # relation_infra_rs_dom_vxlan_ns_def  = var.domain.name
  })
}

variable "vlan_pool_map" {}
