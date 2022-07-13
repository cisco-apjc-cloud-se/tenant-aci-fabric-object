variable "port_channel" {
  type = object({
    name        = string # (Required) Name of Object LACP Policy.
    description = optional(string) # (Optional) Description for object LACP Policy.
    annotation  = optional(string) # (Optional) Annotation for object LACP Policy.
    ctrl        = optional(list(string)) # (Optional) List of LAG control properties. Allowed values are "symmetric-hash", "susp-individual", "graceful-conv", "load-defer" and "fast-sel-hot-stdby". default value is ["fast-sel-hot-stdby", "graceful-conv", "susp-individual"]
    max_links   = optional(number) # (Optional) Maximum number of links. Allowed value range is "1" - "16". Default is "16".
    min_links   = optional(number) # (Optional) Minimum number of links in port channel. Allowed value range is "1" - "16". Default is "1".
    mode        = optional(string) # (Optional) policy mode. Allowed values are "off", "active", "passive", "mac-pin" and "mac-pin-nicload". Default is "off".
    name_alias  = optional(string) # (Optional) Name alias for object LACP Policy.
  })
}
