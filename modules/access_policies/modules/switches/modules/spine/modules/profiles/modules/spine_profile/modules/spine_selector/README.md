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
| <a name="module_node_block"></a> [node\_block](#module\_node\_block) | ./modules/node_block | n/a |

## Resources

| Name | Type |
|------|------|
| [aci_spine_switch_association.selector](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/spine_switch_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_spine_profile_dn"></a> [spine\_profile\_dn](#input\_spine\_profile\_dn) | n/a | `any` | n/a | yes |
| <a name="input_spine_selector"></a> [spine\_selector](#input\_spine\_selector) | n/a | <pre>object({<br>    name                          = string # (Required) Name of Object Spine Switch association.<br>    spine_switch_association_type = string # (Required) Spine association type of Object Spine Switch Association. Allowed values: "ALL", "range", "ALL_IN_POD"<br>    description                   = optional(string) # (Optional) Description for object Spine Switch Association.<br>    annotation                    = optional(string) # (Optional) Annotation for object Spine Switch Association.<br>    name_alias                    = optional(string) # (Optional) Name alias for object Spine Switch Association.<br>    node_blocks = map(object({<br>      name        = string # (Required) Name of Object node block.<br>      annotation  = optional(string) # (Optional) Annotation for object node block.<br>      description = optional(string) # (Optional) Description for object node block.<br>      from_       = optional(number) # (Optional) From Node ID. Range from 1 to 16000. Default value is "1".<br>      name_alias  = optional(string) # (Optional) Name alias for object node block.<br>      to_         = optional(number) # (Optional) To node ID. Range from 1 to 16000. Default value is "1".<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_switch_policy_group_map"></a> [switch\_policy\_group\_map](#input\_switch\_policy\_group\_map) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->