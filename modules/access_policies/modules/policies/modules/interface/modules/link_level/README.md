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
| [aci_fabric_if_pol.link](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/fabric_if_pol) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_link_level"></a> [link\_level](#input\_link\_level) | n/a | <pre>object({<br>    name          = string # (Required) Name of object fabric if pol.<br>    annotation    = optional(string) # (Optional) Annotation for object fabric if pol.<br>    description   = optional(string) # (Optional) Description for object fabric if pol.<br>    auto_neg      = optional(string) # (Optional) Policy auto negotiation for object fabric if pol. Allowed values: "on", "off". Default value is "on".<br>    fec_mode      = optional(string) # (Optional) Forwarding error correction for object fabric if pol. Allowed values: "inherit", "cl91-rs-fec", "cl74-fc-fec", "ieee-rs-fec", "cons16-rs-fec", "kp-fec", "disable-fec". Default value is "inherit".<br>    link_debounce = optional(number) # (Optional) Link debounce interval for object fabric if pol. Range of allowed values: "0" to "5000". Default value is "100".<br>    name_alias    = optional(string) # (Optional) Name alias for object fabric if pol.<br>    speed         = optional(string) # (Optional) Port speed for object fabric if pol. Allowed values: "unknown", "100M", "1G", "10G", "25G", "40G", "50G", "100G","200G", "400G", "inherit". Default value is "inherit".<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | n/a |
<!-- END_TF_DOCS -->