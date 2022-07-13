variable "link_level" {
  type = object({
    name          = string # (Required) Name of object fabric if pol.
    annotation    = optional(string) # (Optional) Annotation for object fabric if pol.
    description   = optional(string) # (Optional) Description for object fabric if pol.
    auto_neg      = optional(string) # (Optional) Policy auto negotiation for object fabric if pol. Allowed values: "on", "off". Default value is "on".
    fec_mode      = optional(string) # (Optional) Forwarding error correction for object fabric if pol. Allowed values: "inherit", "cl91-rs-fec", "cl74-fc-fec", "ieee-rs-fec", "cons16-rs-fec", "kp-fec", "disable-fec". Default value is "inherit".
    link_debounce = optional(number) # (Optional) Link debounce interval for object fabric if pol. Range of allowed values: "0" to "5000". Default value is "100".
    name_alias    = optional(string) # (Optional) Name alias for object fabric if pol.
    speed         = optional(string) # (Optional) Port speed for object fabric if pol. Allowed values: "unknown", "100M", "1G", "10G", "25G", "40G", "50G", "100G","200G", "400G", "inherit". Default value is "inherit".
  })
}
