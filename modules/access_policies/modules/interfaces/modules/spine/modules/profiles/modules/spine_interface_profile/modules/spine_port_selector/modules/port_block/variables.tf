variable "port_block" {
  type = object({
    name        = string # (Optional) name of Object Access Port Block.
    annotation  = optional(string) # (Optional) Annotation for object Access Port Block.
    description = optional(string) # (Optional) Description for object Access Port Block.
    from_card   = number # (Optional) The beginning (from-range) of the card range block for the leaf access port block. Allowed value range is 1-100. Default value is "1".
    from_port   = number # (Optional) The beginning (from-range) of the port range block for the leaf access port block. Allowed value range is 1-127. Default value is "1".
    name_alias  = optional(string) # (Optional) Name alias for object Access Port Block.
    to_card     = number # (Optional) The end (to-range) of the card range block for the leaf access port block. Allowed value range is 1-100. Default value is "1".
    to_port     = number # (Optional) The end (to-range) of the port range block for the leaf access port block. Allowed value range is 1-127. Default value is "1".
  })
}

variable "access_port_selector_dn" {}
