## New Single-Object Fabric Model ##
variable "fabric" {
  type = object({
    name          = string
    use_existing  = optional(bool)
    description   = optional(string)
    ### Fabric Configuration Policies ###
    fabric_policies = object({

    })
    ### Fabric Access Policies ###
    access_policies = object({
      policies = object({
      })
      pools = object({
        vlan_pools = map(object({
          pool_name     = string
          use_existing  = optional(bool)
          description   = optional(string)
          alloc_mode    = string # Allocation mode for object vlan_pool. Allowed values: "dynamic", "static"
          annotation    = optional(string)
          name_alias    = optional(string)
          ranges = map(object({
            description   = optional(string)
            from          = number
            to            = number
            alloc_mode    = optional(string) # Alloc mode for object VLAN Pool ranges. Allowed values: "dynamic", "static", "inherit". Default is "inherit".
            annotation    = optional(string)
            name_alias    = optional(string)
            role          = optional(string) # System role type. Allowed values: "external", "internal". Default is "external".
          }))
        }))
      })
    })
  })
}
