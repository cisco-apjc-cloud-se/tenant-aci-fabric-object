variable "lldp_interface" {
  type = object({
    name        = string # (Required) Name of Object LLDP Interface Policy.
    admin_rx_st = optional(string) # (Optional) Admin receive state. Allowed values are "enabled" and "disabled". Default value is "enabled".
    admin_tx_st = optional(string) # (Optional) Admin transmit state. Allowed values are "enabled" and "disabled". Default value is "enabled".
    description = optional(string) # (Optional) Description for object LLDP Interface Policy.
    annotation  = optional(string) # (Optional) Annotation for object LLDP Interface Policy.
    name_alias  = optional(string) # (Optional) Name alias for object LLDP Interface Policy.
  })
}
