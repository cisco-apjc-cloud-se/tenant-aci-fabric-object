variable "l2_interface" {
  type = object({
    name        = string # (Required) Name of Object L2 interface policy.
    annotation  = optional(string) # (Optional) Annotation for object L2 interface policy.
    description = optional(string) # (Optional) Description for object L2 interface policy.
    name_alias  = optional(string) # (Optional) Name alias for object L2 interface policy.
    qinq        = optional(string) # (Optional) Determines if QinQ is disabled or if the port should be considered a core or edge port. Allowed values are "disabled", "edgePort", "corePort" and "doubleQtagPort". Default is "disabled".
    vepa        = optional(string) # (Optional) Determines if Virtual Ethernet Port Aggregator is disabled or enabled. Allowed values are "disabled" and "enabled". Default is "disabled".
    vlan_scope  = optional(string) # (Optional) The scope of the VLAN. Allowed values are "global" and "portlocal". Default is "global".
  })
}
