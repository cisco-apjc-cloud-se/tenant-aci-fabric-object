variable "aaep" {
  type = object({
    name              = string
    description       = optional(string)
    annotation        = optional(string)
    name_alias        = optional(string)
    enable_infra_vlan = bool
    domain_list       = list(string)
  })
}

variable "domain_map" {}
