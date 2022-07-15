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
| <a name="module_fc_domain"></a> [fc\_domain](#module\_fc\_domain) | ./modules/fc_domain | n/a |
| <a name="module_l3_domain"></a> [l3\_domain](#module\_l3\_domain) | ./modules/l3_domain | n/a |
| <a name="module_physical_domain"></a> [physical\_domain](#module\_physical\_domain) | ./modules/physical_domain | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domains"></a> [domains](#input\_domains) | n/a | <pre>object({<br>    fc_domains = map(object({<br>      name        = string<br>      annotation  = optional(string)<br>      name_alias  = optional(string)<br>      vlan_pool   = string<br>      vsan_pool   = string<br>    }))<br>    l3_domains = map(object({<br>      name        = string<br>      annotation  = optional(string)<br>      name_alias  = optional(string)<br>      vlan_pool   = string<br>    }))<br>    physical_domains = map(object({<br>      name        = string<br>      annotation  = optional(string)<br>      name_alias  = optional(string)<br>      vlan_pool   = string<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_vlan_pool_map"></a> [vlan\_pool\_map](#input\_vlan\_pool\_map) | n/a | `any` | n/a | yes |
| <a name="input_vsan_pool_map"></a> [vsan\_pool\_map](#input\_vsan\_pool\_map) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_domain_map"></a> [domain\_map](#output\_domain\_map) | n/a |
<!-- END_TF_DOCS -->