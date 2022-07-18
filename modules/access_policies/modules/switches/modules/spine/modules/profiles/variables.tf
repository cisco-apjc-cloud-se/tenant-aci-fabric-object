variable "profiles" {
  type = object({
    spine_profiles = map(object({
      name          = string # (Required) Name of Object Spine Profile.
      use_existing  = optional(bool)
      description   = optional(string) # (Optional) Description for object Spine Profile.
      annotation    = optional(string) # (Optional) Annotation for object Spine Profile.
      name_alias    = optional(string) # (Optional) Name alias for object Spine Profile.
      spine_selectors = map(object({
        name                          = string # (Required) Name of Object Spine Switch association.
        use_existing                  = optional(bool)
        spine_switch_association_type = string # (Required) Spine association type of Object Spine Switch Association. Allowed values: "ALL", "range", "ALL_IN_POD"
        description                   = optional(string) # (Optional) Description for object Spine Switch Association.
        annotation                    = optional(string) # (Optional) Annotation for object Spine Switch Association.
        name_alias                    = optional(string) # (Optional) Name alias for object Spine Switch Association.
        policy_group                  = object({
          use_existing  = optional(bool)
          name          = optional(string)
        })
        node_blocks = map(object({
          name        = string # (Required) Name of Object node block.
          annotation  = optional(string) # (Optional) Annotation for object node block.
          description = optional(string) # (Optional) Description for object node block.
          from_       = optional(number) # (Optional) From Node ID. Range from 1 to 16000. Default value is "1".
          name_alias  = optional(string) # (Optional) Name alias for object node block.
          to_         = optional(number) # (Optional) To node ID. Range from 1 to 16000. Default value is "1".
        }))
      }))
      interface_profiles = map(object({
        use_existing  = optional(bool)
        name          = optional(string)
      }))
    }))
  })
}

variable "switch_policy_group_map" {}

variable "interface_profile_map" {}
