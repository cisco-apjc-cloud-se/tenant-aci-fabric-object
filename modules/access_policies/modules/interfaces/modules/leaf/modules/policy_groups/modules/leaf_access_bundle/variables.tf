variable "leaf_access_bundle" {
  type = object({
    name                    = string
    description             = optional(string)
    lag_t                   = optional(string) # The bundled ports group link aggregation type: port channel vs virtual port channel. Allowed values are "not-aggregated", "node" and "link". Default is "link".
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
    pc_intf_policy_name     = optional(string)
  })
}

variable "interface_policy_map" {}

variable "aaep_map" {}
