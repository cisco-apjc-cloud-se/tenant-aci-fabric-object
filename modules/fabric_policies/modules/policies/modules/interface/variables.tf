variable "interface" {
  type = object({
    l3_interface_policies = map(object({
      name        = string # (Required) Name of object L3 Interface Policy.
      annotation  = optional(string) # (Optional) Annotation for object L3 Interface Policy.
      bfd_isis    = optional(string) # (Optional) BFD ISIS Configuration for object L3 Interface Policy. Allowed values are "disabled" and "enabled". Default value is "disabled".
      name_alias  = optional(string) # (Optional) Name alias for object L3 Interface Policy.
      description = optional(string) # (Optional) Description for object L3 Interface Policy.
    }))
  })
}
