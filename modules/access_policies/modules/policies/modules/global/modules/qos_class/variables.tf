variable "qos_class" {
  type = object({
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
  })
}
