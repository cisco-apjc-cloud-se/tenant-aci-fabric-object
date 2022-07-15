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
| [aci_leaf_access_bundle_policy_group.group](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/leaf_access_bundle_policy_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aaep_map"></a> [aaep\_map](#input\_aaep\_map) | n/a | `any` | n/a | yes |
| <a name="input_interface_policy_map"></a> [interface\_policy\_map](#input\_interface\_policy\_map) | n/a | `any` | n/a | yes |
| <a name="input_leaf_access_bundle"></a> [leaf\_access\_bundle](#input\_leaf\_access\_bundle) | n/a | <pre>object({<br>    name                    = string<br>    description             = optional(string)<br>    lag_t                   = optional(string) # The bundled ports group link aggregation type: port channel vs virtual port channel. Allowed values are "not-aggregated", "node" and "link". Default is "link".<br>    annotation              = optional(string)<br>    name_alias              = optional(string)<br>    aaep_name               = optional(string)<br>    link_level_policy_name  = optional(string)<br>    lldp_intf_policy_name   = optional(string)<br>    cdp_intf_policy_name    = optional(string)<br>    mcp_intf_policy_name    = optional(string)<br>    l2_intf_policy_name     = optional(string)<br>    fc_intf_policy_name     = optional(string)<br>    stp_intf_policy_name    = optional(string)<br>    port_sec_policy_name    = optional(string)<br>    pc_intf_policy_name     = optional(string)<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_grp_id"></a> [policy\_grp\_id](#output\_policy\_grp\_id) | n/a |
<!-- END_TF_DOCS -->