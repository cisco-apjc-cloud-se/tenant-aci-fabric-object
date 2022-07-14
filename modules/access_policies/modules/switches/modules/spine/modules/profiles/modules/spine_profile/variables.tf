variable "spine_profile" {
  type = object({
    name        = string # (Required) Name of Object Spine Profile.
    description = optional(string) # (Optional) Description for object Spine Profile.
    annotation  = optional(string) # (Optional) Annotation for object Spine Profile.
    name_alias  = optional(string) # (Optional) Name alias for object Spine Profile.
    spine_selectors = map(object({
      name                          = string # (Required) Name of Object Spine Switch association.
      spine_switch_association_type = string # (Required) Spine association type of Object Spine Switch Association. Allowed values: "ALL", "range", "ALL_IN_POD"
      description                   = optional(string) # (Optional) Description for object Spine Switch Association.
      annotation                    = optional(string) # (Optional) Annotation for object Spine Switch Association.
      name_alias                    = optional(string) # (Optional) Name alias for object Spine Switch Association.
      node_blocks = map(object({
        name        = string # (Required) Name of Object node block.
        annotation  = optional(string) # (Optional) Annotation for object node block.
        description = optional(string) # (Optional) Description for object node block.
        from_       = optional(number) # (Optional) From Node ID. Range from 1 to 16000. Default value is "1".
        name_alias  = optional(string) # (Optional) Name alias for object node block.
        to_         = optional(number) # (Optional) To node ID. Range from 1 to 16000. Default value is "1".
      }))
    }))
  })
}

# relation_infra_rs_sp_acc_port_p - (Optional) Relation to class infraSpAccPortP. Cardinality - N_TO_M. Type - Set of String.

variable "switch_policy_group_map" {}
