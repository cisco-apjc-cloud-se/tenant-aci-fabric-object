variable "profiles" {
  type = object({
    leaf_profiles = map(object({
      name                = string # (Required) Name of Object leaf profile.
      use_existing        = optional(bool)
      description         = optional(string) # (Optional) Description for object leaf profile.
      annotation          = optional(string) # (Optional) Annotation for object leaf profile.
      name_alias          = optional(string) # (Optional) Name alias for object leaf profile.
      leaf_selectors  = map(object({
        name                    = string # (Required) Name of Object switch association.
        use_existing            = optional(bool)
        switch_association_type = string # (Required) The leaf selector type. Allowed values: "ALL", "range", "ALL_IN_POD".
        annotation              = optional(string) # (Optional) Annotation for object switch association.
        description             = optional(string) # (Optional) Description for object switch association.
        name_alias              = optional(string) # (Optional) Name alias for object switch association.
        policy_group            = object({
          use_existing  = optional(bool)
          name          = optional(string)
          })
        node_blocks = map(object({
          name        = string # (Required) Name of Object node block.
          annotation  = optional(string) # (Optional) Annotation for object node block.
          description = optional(string) # (Optional) Description for object node block.
          from_node   = number # (Optional) From Node ID. Range from 1 to 16000. Default value is "1".
          name_alias  = optional(string) # (Optional) Name alias for object node block.
          to_node     = number # (Optional) To node ID. Range from 1 to 16000. Default value is "1".
        }))
      }))
      interface_profiles  = map(object({
        use_existing  = optional(bool)
        name          = optional(string)
        type          = optional(string) # "leaf_interface_profile", "fex_profile"
      }))
    }))
  })
}

variable "switch_policy_group_map" {}

variable "interface_profile_map" {}
