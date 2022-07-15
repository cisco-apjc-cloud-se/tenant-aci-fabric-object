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
| <a name="module_leaf_access_bundle"></a> [leaf\_access\_bundle](#module\_leaf\_access\_bundle) | ./modules/leaf_access_bundle | n/a |
| <a name="module_leaf_access_port"></a> [leaf\_access\_port](#module\_leaf\_access\_port) | ./modules/leaf_access_port | n/a |
| <a name="module_leaf_breakout"></a> [leaf\_breakout](#module\_leaf\_breakout) | ./modules/leaf_breakout | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aaep_map"></a> [aaep\_map](#input\_aaep\_map) | n/a | `any` | n/a | yes |
| <a name="input_interface_policy_map"></a> [interface\_policy\_map](#input\_interface\_policy\_map) | n/a | `any` | n/a | yes |
| <a name="input_policy_groups"></a> [policy\_groups](#input\_policy\_groups) | n/a | <pre>object({<br>    leaf_access_bundles = map(object({<br>      name                    = string<br>      description             = optional(string)<br>      lag_t                   = optional(string) # The bundled ports group link aggregation type: port channel vs virtual port channel. Allowed values are "not-aggregated", "node" and "link". Default is "link".<br>      annotation              = optional(string)<br>      name_alias              = optional(string)<br>      aaep_name               = optional(string)<br>      link_level_policy_name  = optional(string)<br>      lldp_intf_policy_name   = optional(string)<br>      cdp_intf_policy_name    = optional(string)<br>      mcp_intf_policy_name    = optional(string)<br>      l2_intf_policy_name     = optional(string)<br>      fc_intf_policy_name     = optional(string)<br>      stp_intf_policy_name    = optional(string)<br>      port_sec_policy_name    = optional(string)<br>      pc_intf_policy_name     = optional(string)<br>    }))<br>    leaf_access_ports = map(object({<br>      name                    = string<br>      description             = optional(string)<br>      annotation              = optional(string)<br>      name_alias              = optional(string)<br>      aaep_name               = optional(string)<br>      link_level_policy_name  = optional(string)<br>      lldp_intf_policy_name   = optional(string)<br>      cdp_intf_policy_name    = optional(string)<br>      mcp_intf_policy_name    = optional(string)<br>      l2_intf_policy_name     = optional(string)<br>      fc_intf_policy_name     = optional(string)<br>      stp_intf_policy_name    = optional(string)<br>      port_sec_policy_name    = optional(string)<br>    }))<br>    leaf_breakout_ports = map(object({<br>      name        = string # (Required) Name of leaf breakout port group object.<br>      annotation  = optional(string) # (Optional) Annotation for leaf breakout port group object.<br>      brkout_map  = string # (Optional) Breakout map for leaf breakout port group object. Allowed values are "100g-2x", "100g-4x", "10g-4x", "25g-4x", "50g-8x" and "none". Default value is "none".<br>      name_alias  = optional(string) # (Optional) Name alias for leaf breakout port group object.<br>      description = optional(string) # (Optional) Description for leaf breakout port group object.<br>    }))<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_interface_policy_group_map"></a> [interface\_policy\_group\_map](#output\_interface\_policy\_group\_map) | n/a |
<!-- END_TF_DOCS -->