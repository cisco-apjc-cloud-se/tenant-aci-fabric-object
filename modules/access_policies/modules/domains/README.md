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
| <a name="module_fc_domains"></a> [fc\_domains](#module\_fc\_domains) | ./modules/fc_domains | n/a |
| <a name="module_l3_domains"></a> [l3\_domains](#module\_l3\_domains) | ./modules/layer3_domains | n/a |
| <a name="module_physical_domains"></a> [physical\_domains](#module\_physical\_domains) | ./modules/physical_domains | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domains"></a> [domains](#input\_domains) | n/a | <pre>object({<br>    fc_domains = map(object({<br>      name        = string<br>      annotation  = optional(string)<br>      name_alias  = optional(string)<br>      vsan_pool  = object({<br>        use_existing  = optional(bool)<br>        name          = string<br>        alloc_mode    = optional(string)<br>      })<br>      vlan_pool  = object({<br>        use_existing  = optional(bool)<br>        name          = string<br>        alloc_mode    = optional(string)<br>      })<br>    }))<br>    l3_domains = map(object({<br>      name        = string<br>      annotation  = optional(string)<br>      name_alias  = optional(string)<br>      vlan_pool  = object({<br>        use_existing  = optional(bool)<br>        name          = string<br>        alloc_mode    = optional(string)<br>      })<br>    }))<br>    physical_domains = map(object({<br>      name        = string<br>      annotation  = optional(string)<br>      name_alias  = optional(string)<br>      vlan_pool  = object({<br>        use_existing  = optional(bool)<br>        name          = string<br>        alloc_mode    = optional(string)<br>      })<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_vlan_pool_map"></a> [vlan\_pool\_map](#input\_vlan\_pool\_map) | n/a | `any` | n/a | yes |
| <a name="input_vsan_pool_map"></a> [vsan\_pool\_map](#input\_vsan\_pool\_map) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_domain_map"></a> [domain\_map](#output\_domain\_map) | n/a |
<!-- END_TF_DOCS -->