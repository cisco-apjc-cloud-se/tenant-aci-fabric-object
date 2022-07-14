variable "vpc_domain" {
  type = object({
    name        = string # (Required) Name of object VPC Domain Policy.
    annotation  = optional(string) # (Optional) Annotation of object VPC Domain Policy.
    dead_intvl  = optional(string) # (Optional) The VPC peer dead interval time of object VPC Domain Policy. Range: "5" - "600". Default value is "200".
    name_alias  = optional(string) # (Optional) Name Alias of object VPC Domain Policy.
    description = optional(string) # (Optional) Description of object VPC Domain Policy.
  })
}
