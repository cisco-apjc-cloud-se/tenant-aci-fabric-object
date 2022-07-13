variable "leaf_access_port" {
  type = object({
    name                    = string
    description             = optional(string)
    annotation              = optional(string)
    name_alias              = optional(string)
    aaep_name               = optional(string)
    link_level_policy_name  = optional(string)
    lldp_intf_policy_name   = optional(string)
    cdp_intf_policy_name    = optional(string)
    mcp_intf_policy_name    = optional(string)
    l2_intf_policy_name     = optional(string)
    fc_intf_policy_name     = optional(string)
    stp_intf_policy_name    = optional(string)
    port_sec_policy_name    = optional(string)
  })
}

variable "interface_policy_map" {}

variable "aaep_map" {}
