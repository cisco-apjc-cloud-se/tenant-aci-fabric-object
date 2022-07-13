variable "fc_interface" {
  type = object({
    name          = string # (Required) Name of Object interface FC policy.
    annotation    = optional(string) # (Optional) Annotation for object interface FC policy.
    description   = optional(string) # (Optional) Description for object interface FC policy.
    automaxspeed  = optional(string) # (Optional) Auto-max-speed for object interface FC policy. Allowed values are "2G", "4G", "8G", "16G" and "32G". Default value is "32G".
    fill_pattern  = optional(string) # (Optional) Fill Pattern for native FC ports. Allowed values are "ARBFF" and "IDLE". Default is "IDLE".
    name_alias    = optional(string) # (Optional) Name alias for object Interface FC policy.
    port_mode     = optional(string) # (Optional) In which mode Ports should be used. Allowed values are "f" and "np". Default is "f".
    rx_bb_credit  = optional(number) # (Optional) Receive buffer credits for native FC ports Range:(16 - 64). Default value is "64".
    speed         = optional(string) # (Optional) CPU or port speed. All the supported values are "unknown", "auto", "4G", "8G", "16G", "32G". Default value is "auto".
    trunk_mode    = optional(string) # (Optional) Trunking on/off for native FC ports. Allowed values are "un-init", "trunk-off", "trunk-on" and "auto". Default value is "trunk-off".
  })
}
