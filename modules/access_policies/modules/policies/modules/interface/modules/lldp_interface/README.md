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
| [aci_lldp_interface_policy.lldp](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/lldp_interface_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lldp_interface"></a> [lldp\_interface](#input\_lldp\_interface) | n/a | <pre>object({<br>    name        = string # (Required) Name of Object LLDP Interface Policy.<br>    admin_rx_st = optional(string) # (Optional) Admin receive state. Allowed values are "enabled" and "disabled". Default value is "enabled".<br>    admin_tx_st = optional(string) # (Optional) Admin transmit state. Allowed values are "enabled" and "disabled". Default value is "enabled".<br>    description = optional(string) # (Optional) Description for object LLDP Interface Policy.<br>    annotation  = optional(string) # (Optional) Annotation for object LLDP Interface Policy.<br>    name_alias  = optional(string) # (Optional) Name alias for object LLDP Interface Policy.<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | n/a |
<!-- END_TF_DOCS -->