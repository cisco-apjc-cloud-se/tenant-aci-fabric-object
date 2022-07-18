variable "port_selector" {
  type = object({
    name                            = string # (Required) Name of the Spine Access Port Selector.
    use_existing                    = optional(bool)
    spine_access_port_selector_type = optional(string) # (Required) The type of Spine Access Port Selector. Allowed values are "ALL" and "range". Default is "ALL". The "range" can be specified with the resource "aci_access_port_block".
    annotation                      = optional(string) # (Optional) Annotation of the Spine Access Port Selector.
    name_alias                      = optional(string) # (Optional) Name Alias of the Spine Access Port Selector.
    policy_group                    = object({
      use_existing  = optional(bool)
      name          = optional(string) # Interface Policy Group Name
    })
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
  })
}

variable "spine_interface_profile_dn" {}

variable "interface_policy_group_map" {}
