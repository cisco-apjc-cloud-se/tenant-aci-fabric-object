variable "leaf_selector" {
  type = object({
    name                    = string # (Required) Name of Object switch association.
    switch_association_type = string # (Required) The leaf selector type. Allowed values: "ALL", "range", "ALL_IN_POD".
    annotation              = optional(string) # (Optional) Annotation for object switch association.
    description             = optional(string) # (Optional) Description for object switch association.
    name_alias              = optional(string) # (Optional) Name alias for object switch association.
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

# relation_infra_rs_acc_node_p_grp - (Optional) Relation to class infraAccNodePGrp. Cardinality - N_TO_ONE. Type - String.

variable "leaf_profile_dn" {}
