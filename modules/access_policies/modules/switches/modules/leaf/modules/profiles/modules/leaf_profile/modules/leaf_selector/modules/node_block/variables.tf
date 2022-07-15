variable "node_block" {
  type = object({
    name        = string # (Required) Name of Object node block.
    annotation  = optional(string) # (Optional) Annotation for object node block.
    description = optional(string) # (Optional) Description for object node block.
    from_node   = number # (Optional) From Node ID. Range from 1 to 16000. Default value is "1".
    name_alias  = optional(string) # (Optional) Name alias for object node block.
    to_node     = number # (Optional) To node ID. Range from 1 to 16000. Default value is "1".
  })
}

variable "switch_association_dn" {}
