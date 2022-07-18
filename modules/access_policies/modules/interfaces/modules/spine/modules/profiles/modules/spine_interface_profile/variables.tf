variable "interface_profile" {
  type = object({
    name          = string # (Required) Name of Object spine interface profile.
    use_existing  = optional(bool)
    description   = optional(string) # (Optional) Description for object spine interface profile.
    annotation    = optional(string) # (Optional) Annotation for object spine interface profile.
    name_alias    = optional(string) # (Optional) Name alias for object spine interface profile.
    port_selectors = map(object({
      name                            = string # (Required) Name of Object Access Port Selector.
      use_existing                    = optional(bool)
      spine_access_port_selector_type = optional(string) # (Required) The host port selector type. Allowed values are "ALL" and "range". Default is "ALL".
      annotation                      = optional(string) # (Optional) Annotation for object Access Port Selector.
      description                     = optional(string) # (Optional) Description for object Access Port Selector.
      name_alias                      = optional(string) # (Optional) Name alias for object Access Port Selector.
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
    }))
  })
}

variable "interface_policy_group_map" {}
