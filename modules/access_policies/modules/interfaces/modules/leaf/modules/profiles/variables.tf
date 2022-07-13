variables "profiles" {
  type = object({
    fex_profiles = map(object({
      name        = string # (Required) The FEX profile name.
      annotation  = optional(string) # (Optional) Specifies the annotation of the FEX profile name.
      description = optional(string) # (Optional) Specifies the description of the FEX profile name.
      name_alias  = optional(string) # (Optional) Specifies the alias name of the FEX profile name.
    }))
    interface_profiles = map(object({
      name        = string # (Required) Name of Object leaf interface profile.
      description = optional(string) # (Optional) Description for object leaf interface profile.
      annotation  = optional(string) # (Optional) Annotation for object leaf interface profile.
      name_alias  = optional(string) # (Optional) Name alias for object leaf interface profile.
    }))
  })
}

variable "interface_policy_group_map" {}
