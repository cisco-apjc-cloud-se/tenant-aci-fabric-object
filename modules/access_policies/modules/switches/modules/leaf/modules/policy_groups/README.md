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
| <a name="module_access_switch"></a> [access\_switch](#module\_access\_switch) | ./modules/access_switch | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_policy_groups"></a> [policy\_groups](#input\_policy\_groups) | n/a | <pre>object({<br>    access_switches = map(object({<br>      name        = string # (Required) Name of object Access Switch Policy Group.<br>      annotation  = optional(string) # (Optional) Annotation of object Access Switch Policy Group.<br>      name_alias  = optional(string) # (Optional) Name alias for object Access Switch Policy Group.<br>      description = optional(string) # (Optional) Description for object Access Switch Policy Group.<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_switch_policy_map"></a> [switch\_policy\_map](#input\_switch\_policy\_map) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_switch_policy_group_map"></a> [switch\_policy\_group\_map](#output\_switch\_policy\_group\_map) | n/a |
<!-- END_TF_DOCS -->