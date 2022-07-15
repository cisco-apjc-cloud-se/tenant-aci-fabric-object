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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aaep"></a> [aaep](#input\_aaep) | n/a | <pre>object({<br>    description = optional(string)<br>    name        = string<br>    annotation  = optional(string)<br>    name_alias  = optional(string)<br>    domain_list = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_domain_map"></a> [domain\_map](#input\_domain\_map) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aaep_id"></a> [aaep\_id](#output\_aaep\_id) | n/a |
<!-- END_TF_DOCS -->