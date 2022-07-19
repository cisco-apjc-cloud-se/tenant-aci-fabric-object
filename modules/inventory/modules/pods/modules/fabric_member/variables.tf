variable "pod_id" {
  type = number
}

variable "fabric_member" {
  type = object({
    serial      = string # (Required) Serial Number for the new Fabric Node Member.
    name        = string # (Required) Name of Fabric Node member.
    annotation  = optional(string) # (Optional) Specifies the annotation of a Fabric Node member.
    description = optional(string) # (Optional) Specifies the description of a Fabric Node member.
    ext_pool_id = optional(number) # (Optional) external pool ID for object Fabric Node member. Default value: "0".
    fabric_id   = optional(number) # (Optional) Fabric ID for the new Fabric Node Member. Default value: "1".
    name_alias  = optional(string) # (Optional) Name alias for object Fabric Node member.
    node_id     = number # (Optional) Node ID Number for the new Fabric Node Member. Allowed value range: "101" - "4000". Default value: "0".
    node_type   = optional(string) # (Optional) Node type for object Fabric Node member. Allowed values: "unspecified", "remote-leaf-wan". Default value: "unspecified".
    role        = string # (Optional) Role for the new Fabric Node Member. Allowed values: "unspecified", "leaf", "spine". Default value: "unspecified"
  })
}
