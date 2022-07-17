variable "domains" {
  type = object({
    fc_domains = map(object({
      name        = string
      annotation  = optional(string)
      name_alias  = optional(string)
      vsan_pool  = object({
        use_existing  = optional(bool)
        name          = string
        alloc_mode    = optional(string)
      })
      vlan_pool  = object({
        use_existing  = optional(bool)
        name          = string
        alloc_mode    = optional(string)
      })
    }))
    l3_domains = map(object({
      name        = string
      annotation  = optional(string)
      name_alias  = optional(string)
      vlan_pool  = object({
        use_existing  = optional(bool)
        name          = string
        alloc_mode    = optional(string)
      })
    }))
    physical_domains = map(object({
      name        = string
      annotation  = optional(string)
      name_alias  = optional(string)
      vlan_pool  = object({
        use_existing  = optional(bool)
        name          = string
        alloc_mode    = optional(string)
      })
    }))
  })
}

variable "vlan_pool_map" {}

variable "vsan_pool_map" {}
