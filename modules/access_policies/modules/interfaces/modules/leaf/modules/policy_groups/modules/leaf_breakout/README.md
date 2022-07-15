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
| [aci_leaf_breakout_port_group.group](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/leaf_breakout_port_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_breakout"></a> [breakout](#input\_breakout) | n/a | <pre>object({<br>    name        = string # (Required) Name of leaf breakout port group object.<br>    annotation  = optional(string) # (Optional) Annotation for leaf breakout port group object.<br>    brkout_map  = string # (Optional) Breakout map for leaf breakout port group object. Allowed values are "100g-2x", "100g-4x", "10g-4x", "25g-4x", "50g-8x" and "none". Default value is "none".<br>    name_alias  = optional(string) # (Optional) Name alias for leaf breakout port group object.<br>    description = optional(string) # (Optional) Description for leaf breakout port group object.<br>    # relation_infra_rs_mon_brkout_infra_pol - (Optional) Relation to class monInfraPol. Cardinality - N_TO_ONE. Type - String.<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_grp_id"></a> [policy\_grp\_id](#output\_policy\_grp\_id) | n/a |
<!-- END_TF_DOCS -->