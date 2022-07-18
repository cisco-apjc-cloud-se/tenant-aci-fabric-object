variable "leaf_access_port" {
  type = object({
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
    lldp_intf_policy = object({
      use_existing  = optional(bool)
      name          = optional(string)
    })
    cdp_intf_policy = object({
      use_existing  = optional(bool)
      name          = optional(string)
    })
    mcp_intf_policy = object({
      use_existing  = optional(bool)
      name          = optional(string)
    })
    l2_intf_policy = object({
      use_existing  = optional(bool)
      name          = optional(string)
    })
    fc_intf_policy = object({
      use_existing  = optional(bool)
      name          = optional(string)
    })
    stp_intf_policy = object({
      use_existing  = optional(bool)
      name          = optional(string)
    })
    port_sec_policy = object({
      use_existing  = optional(bool)
      name          = optional(string)
    })
  })
}

variable "interface_policy_map" {}

variable "aaep_map" {}
