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

    })
  })
}
