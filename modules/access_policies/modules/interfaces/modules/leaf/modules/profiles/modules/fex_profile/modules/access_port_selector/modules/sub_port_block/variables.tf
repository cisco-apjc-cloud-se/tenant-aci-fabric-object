variable "sub_port_block" {
  type = object({
    name          = string # (Required) Name of Object access sub port block.
    annotation    = optional(string) # (Optional) Annotation for object access sub port block.
    description   = optional(string) # (Optional) Description for object access sub port block.
    from_card     = number # (Optional) From card. Allowed Values are between 1 to 100. Default Value is "1".
    from_port     = number # (Optional) Port block from port Allowed Values are between 1 to 127. Default Value is "1".
    from_sub_port = number # (Optional) From sub port for object access sub port block. Allowed Values are between 1 to 64. Default Value is "1".
    name_alias    = optional(string) # (Optional) Name alias for object access sub port block.
    to_card       = number # (Optional) To card. Allowed Values are between 1 to 100. Default Value is "1".
    to_port       = number # (Optional) To port. Allowed Values are between 1 to 127. Default Value is "1".
    to_sub_port   = number # (Optional) To sub port for object access sub port block. Allowed Values are between 1 to 64. Default Value is "1".
  })
}

variable "access_port_selector_dn" {}
