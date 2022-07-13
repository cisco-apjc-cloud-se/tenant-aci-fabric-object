variable "fex_profile" {
  type = object({
    name        = string # (Required) The FEX profile name.
    annotation  = optional(string) # (Optional) Specifies the annotation of the FEX profile name.
    description = optional(string) # (Optional) Specifies the description of the FEX profile name.
    name_alias  = optional(string) # (Optional) Specifies the alias name of the FEX profile name.
  })
}
