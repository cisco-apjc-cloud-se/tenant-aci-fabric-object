variable "policy_groups" {
  type = object({
    spine_switches = map(object({
      name                  = string # (Required) Name of object Spine Switch Policy Group.
      annotation            = optional(string) # (Optional) Annotation of object Spine Switch Policy Group.
      name_alias            = optional(string) # (Optional) Name alias for object Spine Switch Policy Group.
      description           = optional(string) # (Optional) Description for object Spine Switch Policy Group.
      lldp_intf_policy = object({
        use_existing  = optional(bool)
        name          = optional(string)
      })
      cdp_intf_policy = object({
        use_existing  = optional(bool)
        name          = optional(string)
      })
    }))
  })
}

variable "interface_policy_map" {}
