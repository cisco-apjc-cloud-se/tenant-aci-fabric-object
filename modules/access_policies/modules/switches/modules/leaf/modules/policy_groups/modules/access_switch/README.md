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
| [aci_access_switch_policy_group.group](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/access_switch_policy_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_switch"></a> [access\_switch](#input\_access\_switch) | n/a | <pre>object({<br>    name        = string # (Required) Name of object Access Switch Policy Group.<br>    annotation  = optional(string) # (Optional) Annotation of object Access Switch Policy Group.<br>    name_alias  = optional(string) # (Optional) Name alias for object Access Switch Policy Group.<br>    description = optional(string) # (Optional) Description for object Access Switch Policy Group.<br>  })</pre> | n/a | yes |
| <a name="input_switch_policy_map"></a> [switch\_policy\_map](#input\_switch\_policy\_map) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_grp_id"></a> [policy\_grp\_id](#output\_policy\_grp\_id) | n/a |
<!-- END_TF_DOCS -->