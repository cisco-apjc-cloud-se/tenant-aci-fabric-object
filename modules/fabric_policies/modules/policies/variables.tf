variable "policies" {
  type = object({
    interface = object({
      l3_interface_policies = map(object({
        name        = string # (Required) Name of object L3 Interface Policy.
        annotation  = optional(string) # (Optional) Annotation for object L3 Interface Policy.
        bfd_isis    = optional(string) # (Optional) BFD ISIS Configuration for object L3 Interface Policy. Allowed values are "disabled" and "enabled". Default value is "disabled".
        name_alias  = optional(string) # (Optional) Name alias for object L3 Interface Policy.
        description = optional(string) # (Optional) Description for object L3 Interface Policy.
      }))
    })
    monitoring = object({
      fabric_node_control_policies = map(object({
        name        = string # (Required) Name of object Fabric Node Control.
        annotation  = optional(string) # (Optional) Annotation of object Fabric Node Control.
        control     = optional(string) # (Optional) Fabric node control bitmask of object Fabric Node Control. Allowed values are "Dom" and "None". Default value is "None".
        feature_sel = optional(string) # (Optional) Feature Selection of object Fabric Node Control. Allowed values are "analytics", "netflow" and "telemetry". Default value is "telemetry".
        description = optional(string) # (Optional) Description of object Fabric Node Control.
        name_alias  = optional(string) # (Optional) Name Alias of object Fabric Node Control.
      }))
    })
  })
}
