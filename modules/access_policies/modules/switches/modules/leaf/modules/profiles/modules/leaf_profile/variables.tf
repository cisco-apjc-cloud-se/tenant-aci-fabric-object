variable "leaf_profile" {
  type = object({
    name            = string # (Required) Name of Object leaf profile.
    description     = optional(string) # (Optional) Description for object leaf profile.
    annotation      = optional(string) # (Optional) Annotation for object leaf profile.
    name_alias      = optional(string) # (Optional) Name alias for object leaf profile.
    leaf_selectors  = map(object({
      name                    = string # (Required) Name of Object switch association.
      switch_association_type = string # (Required) The leaf selector type. Allowed values: "ALL", "range", "ALL_IN_POD".
      annotation              = optional(string) # (Optional) Annotation for object switch association.
      description             = optional(string) # (Optional) Description for object switch association.
      name_alias              = optional(string) # (Optional) Name alias for object switch association.
      policy_group_name       = optional(string)
      node_blocks = map(object({
        name        = string # (Required) Name of Object node block.
        annotation  = optional(string) # (Optional) Annotation for object node block.
        description = optional(string) # (Optional) Description for object node block.
        from_node   = number # (Optional) From Node ID. Range from 1 to 16000. Default value is "1".
        name_alias  = optional(string) # (Optional) Name alias for object node block.
        to_node     = number # (Optional) To node ID. Range from 1 to 16000. Default value is "1".
      }))
    }))
  })
}

# relation_infra_rs_acc_card_p - (Optional) Relation to class infraAccCardP. Cardinality - N_TO_M. Type - Set of String.
# relation_infra_rs_acc_port_p - (Optional) Relation to class infraAccPortP. Cardinality - N_TO_M. Type - Set of String.

variable "switch_policy_group_map" {}
