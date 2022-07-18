variable "policy_groups" {
  type = object({
    spine_ports = map(object({
      name                    = string
      description             = optional(string)
      annotation              = optional(string)
      name_alias              = optional(string)
      aaep_profile = object({
        use_existing  = optional(bool)
        name          = optional(string)
      })
      link_level_policy = object({
        use_existing  = optional(bool)
        name          = optional(string)
      })
      cdp_intf_policy = object({
        use_existing  = optional(bool)
        name          = optional(string)
      })
    }))
  })
}
variable "interface_policy_map" {}

variable "aaep_map" {}
