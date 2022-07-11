variable "pool_dn" {}

variable "range" {
  type = object({
    description   = optional(string)
    from          = number
    to            = number
    alloc_mode    = optional(string) # Alloc mode for object VLAN Pool ranges. Allowed values: "dynamic", "static", "inherit". Default is "inherit".
    annotation    = optional(string)
    name_alias    = optional(string)
    role          = optional(string) # System role type. Allowed values: "external", "internal". Default is "external".
  })
  description = "Variable to define a single VLAN pool range.  `to` and `from` should be valid 802.1q VLAN numbers."
}
