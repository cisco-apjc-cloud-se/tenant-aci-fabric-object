variable "mcp_interface" {
  type = object({
    name        = string # (Required) Name of Object miscabling protocol interface policy.
    admin_st    = optional(string) # (Optional) Administrative state of the object or policy. Allowed values are "enabled" and "disabled". Default is "enabled".
    description = optional(string) # (Optional) Description for object miscabling protocol interface policy.
    annotation  = optional(string) # (Optional) Annotation for object miscabling protocol interface policy.
    name_alias  = optional(string) # (Optional) Name alias for object miscabling protocol interface policy.
  })
}
