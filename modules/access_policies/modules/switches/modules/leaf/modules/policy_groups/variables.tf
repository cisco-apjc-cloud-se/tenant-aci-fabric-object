variable "policy_groups" {
  type = object({
    access_switches = map(object({
      name          = string # (Required) Name of object Access Switch Policy Group.
      use_existing  = optional(bool)
      annotation    = optional(string) # (Optional) Annotation of object Access Switch Policy Group.
      name_alias    = optional(string) # (Optional) Name alias for object Access Switch Policy Group.
      description   = optional(string) # (Optional) Description for object Access Switch Policy Group.
    }))
  })
}

variable "switch_policy_map" {}
