variable "switch" {
  type = object({
    vpc_domains = map(object({
      name        = string # (Required) Name of object VPC Domain Policy.
      annotation  = optional(string) # (Optional) Annotation of object VPC Domain Policy.
      dead_intvl  = optional(string) # (Optional) The VPC peer dead interval time of object VPC Domain Policy. Range: "5" - "600". Default value is "200".
      name_alias  = optional(string) # (Optional) Name Alias of object VPC Domain Policy.
      description = optional(string) # (Optional) Description of object VPC Domain Policy.
    }))
    vpc_protection_groups = map(object({
      name                              = string # (Required) Name of Object VPC Explicit Protection Group.
      switch1                           = number # (Required) Node Id of switch 1 to attach.
      switch2                           = number # (Required) Node Id of switch 2 to attach.
      annotation                        = optional(string) # (Optional) Annotation for object VPC Explicit Protection Group.
      vpc_domain_policy                 = optional(string) # (Optional) VPC domain policy name.
      vpc_explicit_protection_group_id  = optional(number) # (Optional) Explicit protection group ID. Integer values are allowed between 1-1000. default value is "0".
    }))
  })
}
