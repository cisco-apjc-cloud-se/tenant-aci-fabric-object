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
| <a name="module_policy_groups"></a> [policy\_groups](#module\_policy\_groups) | ./modules/policy_groups | n/a |
| <a name="module_profiles"></a> [profiles](#module\_profiles) | ./modules/profiles | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aaep_map"></a> [aaep\_map](#input\_aaep\_map) | n/a | `any` | n/a | yes |
| <a name="input_interface_policy_map"></a> [interface\_policy\_map](#input\_interface\_policy\_map) | n/a | `any` | n/a | yes |
| <a name="input_spine"></a> [spine](#input\_spine) | n/a | <pre>object({<br>    policy_groups = object({<br>      spine_ports = map(object({<br>        name                    = string<br>        description             = optional(string)<br>        annotation              = optional(string)<br>        name_alias              = optional(string)<br>        aaep_name               = optional(string)<br>        link_level_policy_name  = optional(string)<br>        cdp_intf_policy_name    = optional(string)<br>      }))<br>    })<br>    profiles = object({<br>      interface_profiles = map(object({<br>        name        = string # (Required) Name of Object spine interface profile.<br>        description = optional(string) # (Optional) Description for object spine interface profile.<br>        annotation  = optional(string) # (Optional) Annotation for object spine interface profile.<br>        name_alias  = optional(string) # (Optional) Name alias for object spine interface profile.<br>        port_selectors = map(object({<br>          name                            = string # (Required) Name of Object Access Port Selector.<br>          spine_access_port_selector_type = optional(string) # (Required) The host port selector type. Allowed values are "ALL" and "range". Default is "ALL".<br>          annotation                      = optional(string) # (Optional) Annotation for object Access Port Selector.<br>          description                     = optional(string) # (Optional) Description for object Access Port Selector.<br>          name_alias                      = optional(string) # (Optional) Name alias for object Access Port Selector.<br>          policy_group_name               = optional(string) # Interface Policy Group Name<br>          port_blocks = map(object({<br>            name        = string # (Optional) name of Object Access Port Block.<br>            annotation  = optional(string) # (Optional) Annotation for object Access Port Block.<br>            description = optional(string) # (Optional) Description for object Access Port Block.<br>            from_card   = number # (Optional) The beginning (from-range) of the card range block for the leaf access port block. Allowed value range is 1-100. Default value is "1".<br>            from_port   = number # (Optional) The beginning (from-range) of the port range block for the leaf access port block. Allowed value range is 1-127. Default value is "1".<br>            name_alias  = optional(string) # (Optional) Name alias for object Access Port Block.<br>            to_card     = number # (Optional) The end (to-range) of the card range block for the leaf access port block. Allowed value range is 1-100. Default value is "1".<br>            to_port     = number # (Optional) The end (to-range) of the port range block for the leaf access port block. Allowed value range is 1-127. Default value is "1".<br>          }))<br>        }))<br>      }))<br>    })<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_interface_profile_map"></a> [interface\_profile\_map](#output\_interface\_profile\_map) | n/a |
<!-- END_TF_DOCS -->