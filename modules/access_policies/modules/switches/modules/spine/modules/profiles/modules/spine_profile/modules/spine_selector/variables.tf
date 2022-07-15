variable "spine_selector" {
  type = object({
    name                          = string # (Required) Name of Object Spine Switch association.
    spine_switch_association_type = string # (Required) Spine association type of Object Spine Switch Association. Allowed values: "ALL", "range", "ALL_IN_POD"
    description                   = optional(string) # (Optional) Description for object Spine Switch Association.
    annotation                    = optional(string) # (Optional) Annotation for object Spine Switch Association.
    name_alias                    = optional(string) # (Optional) Name alias for object Spine Switch Association.
    policy_group_name             = optional(string)
    node_blocks = map(object({
      name        = string # (Required) Name of Object node block.
      annotation  = optional(string) # (Optional) Annotation for object node block.
      description = optional(string) # (Optional) Description for object node block.
      from_       = optional(number) # (Optional) From Node ID. Range from 1 to 16000. Default value is "1".
      name_alias  = optional(string) # (Optional) Name alias for object node block.
      to_         = optional(number) # (Optional) To node ID. Range from 1 to 16000. Default value is "1".
    }))
  })
}

# relation_infra_rs_spine_acc_node_p_grp - (Optional) Relation to class infraSpineAccNodePGrp. Cardinality - N_TO_ONE. Type - String.

variable "spine_profile_dn" {}

variable "switch_policy_group_map" {}
