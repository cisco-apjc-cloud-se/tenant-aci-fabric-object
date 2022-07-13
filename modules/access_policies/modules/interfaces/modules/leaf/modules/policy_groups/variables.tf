variable "policy_group" {
  type = object({
    leaf_access_bundles = map(object({
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
    }))
    leaf_access_ports = map(object({
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
    }))
    leaf_breakout_ports = map(object({
      name        = string # (Required) Name of leaf breakout port group object.
      annotation  = optional(string) # (Optional) Annotation for leaf breakout port group object.
      brkout_map  = string # (Optional) Breakout map for leaf breakout port group object. Allowed values are "100g-2x", "100g-4x", "10g-4x", "25g-4x", "50g-8x" and "none". Default value is "none".
      name_alias  = optional(string) # (Optional) Name alias for leaf breakout port group object.
      description = optional(string) # (Optional) Description for leaf breakout port group object.
    }))
  })
}

variable "interface_policy_map" {}

variable "aaep_map" {}
