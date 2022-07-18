variable "global" {
  type = object({
    aaeps = map(object({
      name                = string
      use_existing        = optional(bool)
      description         = optional(string)
      annotation          = optional(string)
      name_alias          = optional(string)
      enable_infra_vlan   = bool
      associated_domains  = map(object({
        use_existing  = optional(bool)
        name          = string
        type          = optional(string)
      }))
    }))
    qos_class = optional(object({
      name_alias            = optional(string) # "qos_instance_alias"
      description           = optional(string) # "From Terraform"
      etrap_age_timer       = optional(number) # "0"
      etrap_bw_thresh       = optional(number) # "0"
      etrap_byte_ct         = optional(number) # "0"
      etrap_st              = optional(string) # "no"
      fabric_flush_interval = optional(number) # "500"
      fabric_flush_st       = optional(string) # "no"
      annotation            = optional(string) # "orchestrator:terraform"
      ctrl                  = optional(string) # "none"
      uburst_spine_queues   = optional(number) # "10"
      uburst_tor_queues     = optional(number) # "10"
    }))
  })
}

variable "domain_map" {}
