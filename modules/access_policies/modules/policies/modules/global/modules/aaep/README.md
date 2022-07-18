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
| [aci_aaep_to_domain.domain](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/aaep_to_domain) | resource |
| [aci_attachable_access_entity_profile.aaep](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/attachable_access_entity_profile) | resource |
| [aci_vlan_encapsulationfor_vxlan_traffic.infra](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/vlan_encapsulationfor_vxlan_traffic) | resource |
| [aci_attachable_access_entity_profile.aaep](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/attachable_access_entity_profile) | data source |
| [aci_fc_domain.domain](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/fc_domain) | data source |
| [aci_l3_domain_profile.domain](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/l3_domain_profile) | data source |
| [aci_physical_domain.domain](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/physical_domain) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aaep"></a> [aaep](#input\_aaep) | n/a | <pre>object({<br>    name                = string<br>    use_existing        = optional(bool)<br>    description         = optional(string)<br>    annotation          = optional(string)<br>    name_alias          = optional(string)<br>    enable_infra_vlan   = bool<br>    associated_domains  = map(object({<br>      use_existing  = optional(bool)<br>      name          = string<br>      type          = optional(string)<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_domain_map"></a> [domain\_map](#input\_domain\_map) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aaep_id"></a> [aaep\_id](#output\_aaep\_id) | n/a |
<!-- END_TF_DOCS -->