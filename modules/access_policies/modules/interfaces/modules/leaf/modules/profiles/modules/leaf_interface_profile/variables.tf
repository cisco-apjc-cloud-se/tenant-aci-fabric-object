variable "interface_profile" {
  type = object({
    name        = string # (Required) Name of Object leaf interface profile.
    description = optional(string) # (Optional) Description for object leaf interface profile.
    annotation  = optional(string) # (Optional) Annotation for object leaf interface profile.
    name_alias  = optional(string) # (Optional) Name alias for object leaf interface profile.
  })
}

variable "interface_policy_group_map" {}
