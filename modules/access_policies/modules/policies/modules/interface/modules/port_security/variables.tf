variable "port_security" {
  type = object({
    name        = string # (Required) Name of Object port security policy.
    description = optional(string) # (Optional) Description for object port security policy.
    annotation  = optional(string) # (Optional) Annotation for object port security policy.
    maximum     = optional(number) # (Optional) Port Security Maximum. Allowed value range is "0" - "12000". Default is "0".
    name_alias  = optional(string) # (Optional) Name alias for object port security policy.
    timeout     = optional(number) # (Optional) Amount of time between authentication attempts. Allowed value range is "60" - "3600". Default is "60".
    violation   = optional(string) # (Optional) Port Security Violation. default value is "protect". Allowed value: "protect"
  })
}
