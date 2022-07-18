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
| <a name="module_spine_switch"></a> [spine\_switch](#module\_spine\_switch) | ./modules/spine_switch | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_interface_policy_map"></a> [interface\_policy\_map](#input\_interface\_policy\_map) | n/a | `any` | n/a | yes |
| <a name="input_policy_groups"></a> [policy\_groups](#input\_policy\_groups) | n/a | <pre>object({<br>    spine_switches = map(object({<br>      name                  = string # (Required) Name of object Spine Switch Policy Group.<br>      annotation            = optional(string) # (Optional) Annotation of object Spine Switch Policy Group.<br>      name_alias            = optional(string) # (Optional) Name alias for object Spine Switch Policy Group.<br>      description           = optional(string) # (Optional) Description for object Spine Switch Policy Group.<br>      lldp_intf_policy = object({<br>        use_existing  = optional(bool)<br>        name          = optional(string)<br>      })<br>      cdp_intf_policy = object({<br>        use_existing  = optional(bool)<br>        name          = optional(string)<br>      })<br>    }))<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_switch_policy_group_map"></a> [switch\_policy\_group\_map](#output\_switch\_policy\_group\_map) | n/a |
<!-- END_TF_DOCS -->