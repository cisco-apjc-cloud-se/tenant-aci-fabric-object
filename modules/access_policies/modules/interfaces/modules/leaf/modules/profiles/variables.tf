variable "profiles" {
  type = object({
    fex_profiles = map(object({
      name        = string # (Required) The FEX profile name.
      annotation  = optional(string) # (Optional) Specifies the annotation of the FEX profile name.
      description = optional(string) # (Optional) Specifies the description of the FEX profile name.
      name_alias  = optional(string) # (Optional) Specifies the alias name of the FEX profile name.
      port_selectors = map(object({
        name                      = string # (Required) Name of Object Access Port Selector.
        access_port_selector_type = optional(string) # (Required) The host port selector type. Allowed values are "ALL" and "range". Default is "ALL".
        annotation                = optional(string) # (Optional) Annotation for object Access Port Selector.
        description               = optional(string) # (Optional) Description for object Access Port Selector.
        name_alias                = optional(string) # (Optional) Name alias for object Access Port Selector.
        policy_group_name         = optional(string) # Interface Policy Group Name
        port_blocks = map(object({
          name        = string # (Optional) name of Object Access Port Block.
          annotation  = optional(string) # (Optional) Annotation for object Access Port Block.
          description = optional(string) # (Optional) Description for object Access Port Block.
          from_card   = number # (Optional) The beginning (from-range) of the card range block for the leaf access port block. Allowed value range is 1-100. Default value is "1".
          from_port   = number # (Optional) The beginning (from-range) of the port range block for the leaf access port block. Allowed value range is 1-127. Default value is "1".
          name_alias  = optional(string) # (Optional) Name alias for object Access Port Block.
          to_card     = number # (Optional) The end (to-range) of the card range block for the leaf access port block. Allowed value range is 1-100. Default value is "1".
          to_port     = number # (Optional) The end (to-range) of the port range block for the leaf access port block. Allowed value range is 1-127. Default value is "1".
        }))
        sub_port_blocks = map(object({
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
        }))
      }))
    }))
    interface_profiles = map(object({
      name        = string # (Required) Name of Object leaf interface profile.
      description = optional(string) # (Optional) Description for object leaf interface profile.
      annotation  = optional(string) # (Optional) Annotation for object leaf interface profile.
      name_alias  = optional(string) # (Optional) Name alias for object leaf interface profile.
      port_selectors = map(object({
        name                      = string # (Required) Name of Object Access Port Selector.
        access_port_selector_type = optional(string) # (Required) The host port selector type. Allowed values are "ALL" and "range". Default is "ALL".
        annotation                = optional(string) # (Optional) Annotation for object Access Port Selector.
        description               = optional(string) # (Optional) Description for object Access Port Selector.
        name_alias                = optional(string) # (Optional) Name alias for object Access Port Selector.
        policy_group_name         = optional(string) # Interface Policy Group Name
        port_blocks = map(object({
          name        = string # (Optional) name of Object Access Port Block.
          annotation  = optional(string) # (Optional) Annotation for object Access Port Block.
          description = optional(string) # (Optional) Description for object Access Port Block.
          from_card   = number # (Optional) The beginning (from-range) of the card range block for the leaf access port block. Allowed value range is 1-100. Default value is "1".
          from_port   = number # (Optional) The beginning (from-range) of the port range block for the leaf access port block. Allowed value range is 1-127. Default value is "1".
          name_alias  = optional(string) # (Optional) Name alias for object Access Port Block.
          to_card     = number # (Optional) The end (to-range) of the card range block for the leaf access port block. Allowed value range is 1-100. Default value is "1".
          to_port     = number # (Optional) The end (to-range) of the port range block for the leaf access port block. Allowed value range is 1-127. Default value is "1".
        }))
        sub_port_blocks = map(object({
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
        }))
      }))
    }))
  })
}

variable "interface_policy_group_map" {}
