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
| [aci_leaf_selector.selector](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/leaf_selector) | resource |
| [aci_leaf_selector.selector](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/leaf_selector) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_leaf_profile_dn"></a> [leaf\_profile\_dn](#input\_leaf\_profile\_dn) | n/a | `any` | n/a | yes |
| <a name="input_leaf_selector"></a> [leaf\_selector](#input\_leaf\_selector) | n/a | <pre>object({<br>    name                    = string # (Required) Name of Object switch association.<br>    use_existing            = optional(bool)<br>    switch_association_type = string # (Required) The leaf selector type. Allowed values: "ALL", "range", "ALL_IN_POD".<br>    annotation              = optional(string) # (Optional) Annotation for object switch association.<br>    description             = optional(string) # (Optional) Description for object switch association.<br>    name_alias              = optional(string) # (Optional) Name alias for object switch association.<br>    policy_group            = object({<br>      use_existing  = optional(bool)<br>      name          = optional(string)<br>      })<br>    node_blocks = map(object({<br>      name        = string # (Required) Name of Object node block.<br>      annotation  = optional(string) # (Optional) Annotation for object node block.<br>      description = optional(string) # (Optional) Description for object node block.<br>      from_node   = number # (Optional) From Node ID. Range from 1 to 16000. Default value is "1".<br>      name_alias  = optional(string) # (Optional) Name alias for object node block.<br>      to_node     = number # (Optional) To node ID. Range from 1 to 16000. Default value is "1".<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_switch_policy_group_map"></a> [switch\_policy\_group\_map](#input\_switch\_policy\_group\_map) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->