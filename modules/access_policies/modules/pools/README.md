<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aci"></a> [aci](#requirement\_aci) | >=2.0.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vlan_pool"></a> [vlan\_pool](#module\_vlan\_pool) | ./modules/vlan_pool | n/a |
| <a name="module_vsan_pool"></a> [vsan\_pool](#module\_vsan\_pool) | ./modules/vsan_pool | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_pools"></a> [pools](#input\_pools) | n/a | <pre>object({<br>    vlan_pools = map(object({<br>      name          = string<br>      use_existing  = optional(bool)<br>      description   = optional(string)<br>      alloc_mode    = string # Allocation mode for object vlan_pool. Allowed values: "dynamic", "static"<br>      annotation    = optional(string)<br>      name_alias    = optional(string)<br>      ranges = map(object({<br>        description   = optional(string)<br>        from          = number<br>        to            = number<br>        alloc_mode    = optional(string) # Alloc mode for object VLAN Pool ranges. Allowed values: "dynamic", "static", "inherit". Default is "inherit".<br>        annotation    = optional(string)<br>        name_alias    = optional(string)<br>        role          = optional(string) # System role type. Allowed values: "external", "internal". Default is "external".<br>      }))<br>    }))<br>    vsan_pools = map(object({<br>      name          = string<br>      use_existing  = optional(bool)<br>      description   = optional(string)<br>      alloc_mode    = optional(string) # Allocation mode for object vsan_pool. Allowed values: "static"<br>      annotation    = optional(string)<br>      name_alias    = optional(string)<br>      ranges = map(object({<br>        description   = optional(string)<br>        from          = number<br>        to            = number<br>        alloc_mode    = optional(string) # Alloc mode for object VSAN Pool ranges. Allowed values: "static", "inherit". Default is "inherit".<br>        annotation    = optional(string)<br>        name_alias    = optional(string)<br>        role          = optional(string) # System role type. Allowed values: "external", "internal". Default is "external".<br>      }))<br>    }))<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vlan_pool_map"></a> [vlan\_pool\_map](#output\_vlan\_pool\_map) | n/a |
| <a name="output_vsan_pool_map"></a> [vsan\_pool\_map](#output\_vsan\_pool\_map) | n/a |
<!-- END_TF_DOCS -->