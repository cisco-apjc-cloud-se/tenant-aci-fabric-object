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
| [aci_lacp_policy.pc](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/lacp_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_port_channel"></a> [port\_channel](#input\_port\_channel) | n/a | <pre>object({<br>    name        = string # (Required) Name of Object LACP Policy.<br>    description = optional(string) # (Optional) Description for object LACP Policy.<br>    annotation  = optional(string) # (Optional) Annotation for object LACP Policy.<br>    ctrl        = optional(list(string)) # (Optional) List of LAG control properties. Allowed values are "symmetric-hash", "susp-individual", "graceful-conv", "load-defer" and "fast-sel-hot-stdby". default value is ["fast-sel-hot-stdby", "graceful-conv", "susp-individual"]<br>    max_links   = optional(number) # (Optional) Maximum number of links. Allowed value range is "1" - "16". Default is "16".<br>    min_links   = optional(number) # (Optional) Minimum number of links in port channel. Allowed value range is "1" - "16". Default is "1".<br>    mode        = optional(string) # (Optional) policy mode. Allowed values are "off", "active", "passive", "mac-pin" and "mac-pin-nicload". Default is "off".<br>    name_alias  = optional(string) # (Optional) Name alias for object LACP Policy.<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | n/a |
<!-- END_TF_DOCS -->