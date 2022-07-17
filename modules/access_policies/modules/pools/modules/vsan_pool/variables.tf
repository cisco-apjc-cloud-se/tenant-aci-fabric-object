variable "vsan_pool" {
  type = object({
    name          = string
    use_existing  = optional(bool)
    description   = optional(string)
    alloc_mode    = optional(string) # Allocation mode for object vsan_pool. Allowed values: "static"
    annotation    = optional(string)
    name_alias    = optional(string)
    ranges = map(object({
      description   = optional(string)
      from          = number
      to            = number
      alloc_mode    = optional(string) # Alloc mode for object VSAN Pool ranges. Allowed values: "static", "inherit". Default is "inherit".
      annotation    = optional(string)
      name_alias    = optional(string)
      role          = optional(string) # System role type. Allowed values: "external", "internal". Default is "external".
    }))
  })
}
