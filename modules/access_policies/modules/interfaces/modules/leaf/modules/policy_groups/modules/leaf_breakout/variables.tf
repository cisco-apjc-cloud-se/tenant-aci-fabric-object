variable "breakout" {
  type = object({
    name        = string # (Required) Name of leaf breakout port group object.
    annotation  = optional(string) # (Optional) Annotation for leaf breakout port group object.
    brkout_map  = string # (Optional) Breakout map for leaf breakout port group object. Allowed values are "100g-2x", "100g-4x", "10g-4x", "25g-4x", "50g-8x" and "none". Default value is "none".
    name_alias  = optional(string) # (Optional) Name alias for leaf breakout port group object.
    description = optional(string) # (Optional) Description for leaf breakout port group object.
    # relation_infra_rs_mon_brkout_infra_pol - (Optional) Relation to class monInfraPol. Cardinality - N_TO_ONE. Type - String.
  })
}
