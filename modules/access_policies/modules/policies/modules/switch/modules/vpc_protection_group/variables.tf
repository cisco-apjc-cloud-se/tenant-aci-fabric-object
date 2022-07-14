variable "vpc_protection_group" {
  type = object({
    name                              = string # (Required) Name of Object VPC Explicit Protection Group.
    switch1                           = string # (Required) Node Id of switch 1 to attach.
    switch2                           = string # (Required) Node Id of switch 2 to attach.
    annotation                        = optional(string) # (Optional) Annotation for object VPC Explicit Protection Group.
    vpc_domain_policy                 = optional(string) # (Optional) VPC domain policy name.
    vpc_explicit_protection_group_id  = optional(number) # (Optional) Explicit protection group ID. Integer values are allowed between 1-1000. default value is "0".
  })
}
