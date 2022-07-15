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

No modules.

## Resources

| Name | Type |
|------|------|
| [aci_ranges.range](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/ranges) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_pool_dn"></a> [pool\_dn](#input\_pool\_dn) | n/a | `any` | n/a | yes |
| <a name="input_range"></a> [range](#input\_range) | Variable to define a single VLAN pool range.  `to` and `from` should be valid 802.1q VLAN numbers. | <pre>object({<br>    description   = optional(string)<br>    from          = number<br>    to            = number<br>    alloc_mode    = optional(string) # Alloc mode for object VLAN Pool ranges. Allowed values: "dynamic", "static", "inherit". Default is "inherit".<br>    annotation    = optional(string)<br>    name_alias    = optional(string)<br>    role          = optional(string) # System role type. Allowed values: "external", "internal". Default is "external".<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->