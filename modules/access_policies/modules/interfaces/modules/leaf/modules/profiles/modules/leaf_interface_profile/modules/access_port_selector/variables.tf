variable "port_selector" {
  type = object({
    name                      = string # (Required) Name of Object Access Port Selector.
    access_port_selector_type = optional(string) # (Required) The host port selector type. Allowed values are "ALL" and "range". Default is "ALL".
    annotation                = optional(string) # (Optional) Annotation for object Access Port Selector.
    description               = optional(string) # (Optional) Description for object Access Port Selector.
    name_alias                = optional(string) # (Optional) Name alias for object Access Port Selector.
    policy_group_name         = string # Interface Policy Group Name
  })
}

variable "leaf_interface_profile_dn" {}

variable "interface_policy_group_map" {}
