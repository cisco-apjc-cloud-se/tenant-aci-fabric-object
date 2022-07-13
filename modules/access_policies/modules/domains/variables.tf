variable "domains" {
  type = object({
    fc_domains = map(object({
      name        = string
      annotation  = optional(string)
      name_alias  = optional(string)
      vlan_pool   = string
      vsan_pool   = string
    }))
    l3_domains = map(object({
      name        = string
      annotation  = optional(string)
      name_alias  = optional(string)
      vlan_pool   = string
    }))
    physical_domains = map(object({
      name        = string
      annotation  = optional(string)
      name_alias  = optional(string)
      vlan_pool   = string
    }))
  })
}

variable "vlan_pool_map" {}

variable "vsan_pool_map" {}
