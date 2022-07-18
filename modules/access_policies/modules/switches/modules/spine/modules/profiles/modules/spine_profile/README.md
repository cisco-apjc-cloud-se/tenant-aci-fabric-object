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
| <a name="module_spine_selector"></a> [spine\_selector](#module\_spine\_selector) | ./modules/spine_selector | n/a |

## Resources

| Name | Type |
|------|------|
| [aci_spine_profile.profile](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/spine_profile) | resource |
| [aci_spine_interface_profile.profile](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/spine_interface_profile) | data source |
| [aci_spine_profile.profile](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/spine_profile) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_interface_profile_map"></a> [interface\_profile\_map](#input\_interface\_profile\_map) | n/a | `any` | n/a | yes |
| <a name="input_spine_profile"></a> [spine\_profile](#input\_spine\_profile) | n/a | <pre>object({<br>    name          = string # (Required) Name of Object Spine Profile.<br>    use_existing  = optional(bool)<br>    description   = optional(string) # (Optional) Description for object Spine Profile.<br>    annotation    = optional(string) # (Optional) Annotation for object Spine Profile.<br>    name_alias    = optional(string) # (Optional) Name alias for object Spine Profile.<br>    spine_selectors = map(object({<br>      name                          = string # (Required) Name of Object Spine Switch association.<br>      use_existing                  = optional(bool)<br>      spine_switch_association_type = string # (Required) Spine association type of Object Spine Switch Association. Allowed values: "ALL", "range", "ALL_IN_POD"<br>      description                   = optional(string) # (Optional) Description for object Spine Switch Association.<br>      annotation                    = optional(string) # (Optional) Annotation for object Spine Switch Association.<br>      name_alias                    = optional(string) # (Optional) Name alias for object Spine Switch Association.<br>      policy_group                  = object({<br>        use_existing  = optional(bool)<br>        name          = optional(string)<br>      })<br>      node_blocks = map(object({<br>        name        = string # (Required) Name of Object node block.<br>        annotation  = optional(string) # (Optional) Annotation for object node block.<br>        description = optional(string) # (Optional) Description for object node block.<br>        from_       = optional(number) # (Optional) From Node ID. Range from 1 to 16000. Default value is "1".<br>        name_alias  = optional(string) # (Optional) Name alias for object node block.<br>        to_         = optional(number) # (Optional) To node ID. Range from 1 to 16000. Default value is "1".<br>      }))<br>    }))<br>    interface_profiles = map(object({<br>      use_existing  = optional(bool)<br>      name          = optional(string)<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_switch_policy_group_map"></a> [switch\_policy\_group\_map](#input\_switch\_policy\_group\_map) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->