<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aci"></a> [aci](#requirement\_aci) | >=2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aci"></a> [aci](#provider\_aci) | >=2.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ranges"></a> [ranges](#module\_ranges) | ./modules/ranges | n/a |

## Resources

| Name | Type |
|------|------|
| [aci_vlan_pool.pool](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/vlan_pool) | resource |
| [aci_vlan_pool.pool](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/vlan_pool) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vlan_pool"></a> [vlan\_pool](#input\_vlan\_pool) | n/a | <pre>object({<br>    pool_name     = string<br>    use_existing  = optional(bool)<br>    description   = optional(string)<br>    alloc_mode    = string # Allocation mode for object vlan_pool. Allowed values: "dynamic", "static"<br>    annotation    = optional(string)<br>    name_alias    = optional(string)<br>    ranges = map(object({<br>      description   = optional(string)<br>      from          = number<br>      to            = number<br>      alloc_mode    = optional(string) # Alloc mode for object VLAN Pool ranges. Allowed values: "dynamic", "static", "inherit". Default is "inherit".<br>      annotation    = optional(string)<br>      name_alias    = optional(string)<br>      role          = optional(string) # System role type. Allowed values: "external", "internal". Default is "external".<br>    }))<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pool_id"></a> [pool\_id](#output\_pool\_id) | n/a |
<!-- END_TF_DOCS -->