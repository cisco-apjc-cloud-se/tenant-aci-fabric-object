variable "aaep" {
  type = object({
    description = optional(string)
    name        = string
    annotation  = optional(string)
    name_alias  = optional(string)
    domain_list = list(string)
  })
}

variable "domain_map" {}
