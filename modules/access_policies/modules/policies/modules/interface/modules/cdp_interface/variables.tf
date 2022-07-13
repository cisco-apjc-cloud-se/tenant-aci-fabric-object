variable "cdp_interface" {
  type = object({
    name        = string # (Required) Name of Object cdp interface policy.
    admin_st    = optional(string) # (Optional) Administrative state. Allowed values: "enabled", "disabled". Default value is "enabled".
    annotation  = optional(string) # (Optional) Annotation for object cdp interface policy.
    name_alias  = optional(string) # (Optional) Name alias for object cdp interface policy.
    description = optional(string) # (Optional) Description for object cdp interface policy.
  })
}
