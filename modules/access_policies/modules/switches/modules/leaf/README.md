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
| <a name="input_interface_profile_map"></a> [interface\_profile\_map](#input\_interface\_profile\_map) | n/a | `any` | n/a | yes |
| <a name="input_leaf"></a> [leaf](#input\_leaf) | n/a | <pre>object({<br>    policy_groups = object({<br>      access_switches = map(object({<br>        name          = string # (Required) Name of object Access Switch Policy Group.<br>        use_existing  = optional(bool)<br>        annotation    = optional(string) # (Optional) Annotation of object Access Switch Policy Group.<br>        name_alias    = optional(string) # (Optional) Name alias for object Access Switch Policy Group.<br>        description   = optional(string) # (Optional) Description for object Access Switch Policy Group.<br>      }))<br>    })<br>    profiles = object({<br>      leaf_profiles = map(object({<br>        name                = string # (Required) Name of Object leaf profile.<br>        use_existing        = optional(bool)<br>        description         = optional(string) # (Optional) Description for object leaf profile.<br>        annotation          = optional(string) # (Optional) Annotation for object leaf profile.<br>        name_alias          = optional(string) # (Optional) Name alias for object leaf profile.<br>        leaf_selectors  = map(object({<br>          name                    = string # (Required) Name of Object switch association.<br>          use_existing            = optional(bool)<br>          switch_association_type = string # (Required) The leaf selector type. Allowed values: "ALL", "range", "ALL_IN_POD".<br>          annotation              = optional(string) # (Optional) Annotation for object switch association.<br>          description             = optional(string) # (Optional) Description for object switch association.<br>          name_alias              = optional(string) # (Optional) Name alias for object switch association.<br>          policy_group            = object({<br>            use_existing  = optional(bool)<br>            name          = optional(string)<br>            })<br>          node_blocks = map(object({<br>            name        = string # (Required) Name of Object node block.<br>            annotation  = optional(string) # (Optional) Annotation for object node block.<br>            description = optional(string) # (Optional) Description for object node block.<br>            from_node   = number # (Optional) From Node ID. Range from 1 to 16000. Default value is "1".<br>            name_alias  = optional(string) # (Optional) Name alias for object node block.<br>            to_node     = number # (Optional) To node ID. Range from 1 to 16000. Default value is "1".<br>          }))<br>        }))<br>        interface_profiles  = map(object({<br>          use_existing  = optional(bool)<br>          name          = optional(string)<br>          type          = optional(string) # "leaf_interface_profile", "fex_profile"<br>        }))<br>      }))<br>    })<br>  })</pre> | n/a | yes |
| <a name="input_switch_policy_map"></a> [switch\_policy\_map](#input\_switch\_policy\_map) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->