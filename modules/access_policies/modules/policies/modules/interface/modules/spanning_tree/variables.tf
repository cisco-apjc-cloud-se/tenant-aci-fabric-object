variable "spanning_tree" {
  type = object({
    name        = string # (Required) Name of object Spanning Tree Interface Policy.
    annotation  = optional(string) # (Optional) Annotation of object Spanning Tree Interface Policy.
    name_alias  = optional(string) # (Optional) Name alias of object Spanning Tree Interface Policy.
    description = optional(string) # (Optional) Description of object Spanning Tree Interface Policy.
    ctrl        = optional(list(string)) # (Optional) Interface controls. Allowed values are "bpdu-filter", "bpdu-guard", "unspecified". The default value is "unspecified". Unspecified value should not be added along with other allowed values. Type: List.
  })
}
