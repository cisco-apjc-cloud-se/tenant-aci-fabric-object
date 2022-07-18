variable "aaep" {
  type = object({
    name                = string
    use_existing        = optional(bool)
    description         = optional(string)
    annotation          = optional(string)
    name_alias          = optional(string)
    enable_infra_vlan   = bool
    associated_domains  = map(object({
      use_existing  = optional(bool)
      name          = string
      type          = optional(string)
    }))
  })
}

variable "domain_map" {}
