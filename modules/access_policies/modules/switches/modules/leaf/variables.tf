variable "leaf" {
  type = object({
    policy_groups = object({
      access_switches = map(object({
        name        = string # (Required) Name of object Access Switch Policy Group.
        annotation  = optional(string) # (Optional) Annotation of object Access Switch Policy Group.
        name_alias  = optional(string) # (Optional) Name alias for object Access Switch Policy Group.
        description = optional(string) # (Optional) Description for object Access Switch Policy Group.
      }))
    })
    profiles = object({
      leaf_profiles = map(object({
        name            = string # (Required) Name of Object leaf profile.
        description     = optional(string) # (Optional) Description for object leaf profile.
        annotation      = optional(string) # (Optional) Annotation for object leaf profile.
        name_alias      = optional(string) # (Optional) Name alias for object leaf profile.
        leaf_selectors  = map(object({
          name                    = string # (Required) Name of Object switch association.
          switch_association_type = string # (Required) The leaf selector type. Allowed values: "ALL", "range", "ALL_IN_POD".
          annotation              = optional(string) # (Optional) Annotation for object switch association.
          description             = optional(string) # (Optional) Description for object switch association.
          name_alias              = optional(string) # (Optional) Name alias for object switch association.
          node_blocks = map(object({
            name        = string # (Required) Name of Object node block.
            annotation  = optional(string) # (Optional) Annotation for object node block.
            description = optional(string) # (Optional) Description for object node block.
            from_       = optional(number) # (Optional) From Node ID. Range from 1 to 16000. Default value is "1".
            name_alias  = optional(string) # (Optional) Name alias for object node block.
            to_         = optional(number) # (Optional) To node ID. Range from 1 to 16000. Default value is "1".
          }))
        }))
      }))
    })
  })
}

variable "switch_policy_map" {}
