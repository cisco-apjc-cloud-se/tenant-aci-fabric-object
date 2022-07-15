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
| [aci_physical_domain.domain](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/physical_domain) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_physical_domain"></a> [physical\_domain](#input\_physical\_domain) | n/a | <pre>object({<br>    name                                = string<br>    annotation                          = optional(string)<br>    name_alias                          = optional(string)<br>    vlan_pool                           = string<br>    # relation_infra_rs_vlan_ns           = var.domain.name<br>    # relation_infra_rs_vlan_ns_def       = var.domain.name<br>    # relation_infra_rs_vip_addr_ns       = var.domain.name<br>    # relation_infra_rs_dom_vxlan_ns_def  = var.domain.name<br>  })</pre> | n/a | yes |
| <a name="input_vlan_pool_map"></a> [vlan\_pool\_map](#input\_vlan\_pool\_map) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_domain_id"></a> [domain\_id](#output\_domain\_id) | n/a |
<!-- END_TF_DOCS -->