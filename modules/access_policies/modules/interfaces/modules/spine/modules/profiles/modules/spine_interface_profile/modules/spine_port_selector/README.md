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
| <a name="module_port_block"></a> [port\_block](#module\_port\_block) | ./modules/port_block | n/a |

## Resources

| Name | Type |
|------|------|
| [aci_spine_access_port_selector.selector](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/spine_access_port_selector) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_interface_policy_group_map"></a> [interface\_policy\_group\_map](#input\_interface\_policy\_group\_map) | n/a | `any` | n/a | yes |
| <a name="input_port_selector"></a> [port\_selector](#input\_port\_selector) | n/a | <pre>object({<br>    name                            = string # (Required) Name of the Spine Access Port Selector.<br>    spine_access_port_selector_type = optional(string) # (Required) The type of Spine Access Port Selector. Allowed values are "ALL" and "range". Default is "ALL". The "range" can be specified with the resource "aci_access_port_block".<br>    annotation                      = optional(string) # (Optional) Annotation of the Spine Access Port Selector.<br>    name_alias                      = optional(string) # (Optional) Name Alias of the Spine Access Port Selector.<br>    policy_group_name               = optional(string) # Interface Policy Group Name<br>    port_blocks = map(object({<br>      name        = string # (Optional) name of Object Access Port Block.<br>      annotation  = optional(string) # (Optional) Annotation for object Access Port Block.<br>      description = optional(string) # (Optional) Description for object Access Port Block.<br>      from_card   = number # (Optional) The beginning (from-range) of the card range block for the leaf access port block. Allowed value range is 1-100. Default value is "1".<br>      from_port   = number # (Optional) The beginning (from-range) of the port range block for the leaf access port block. Allowed value range is 1-127. Default value is "1".<br>      name_alias  = optional(string) # (Optional) Name alias for object Access Port Block.<br>      to_card     = number # (Optional) The end (to-range) of the card range block for the leaf access port block. Allowed value range is 1-100. Default value is "1".<br>      to_port     = number # (Optional) The end (to-range) of the port range block for the leaf access port block. Allowed value range is 1-127. Default value is "1".<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_spine_interface_profile_dn"></a> [spine\_interface\_profile\_dn](#input\_spine\_interface\_profile\_dn) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->