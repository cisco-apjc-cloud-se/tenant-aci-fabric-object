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
| [aci_mcp_instance_policy.policy](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/mcp_instance_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_mcp_instance"></a> [mcp\_instance](#input\_mcp\_instance) | n/a | <pre>object({<br>    annotation        = optional(string) # (Optional) Annotation of object MCP Instance Policy.<br>    admin_st          = optional(string) # (Optional) Admin State. The administrative state of the object or policy. Allowed values are "disabled", "enabled". Type: String.<br>    description       = optional(string) # (Optional) Description for object MCP Instance Policy. Type: String.<br>    name_alias        = optional(string) # (Optional) Name Alias for object MCP Instance Policy. Type: String.<br>    ctrl              = optional(list(string)) # (Optional) Controls. The control state. Allowed values are "pdu-per-vlan", "stateful-ha". Type: List.<br>    init_delay_time   = optional(number) # (Optional) Init Delay Time. Allowed range is "0"-"1800". Type: String.<br>    key               = string # (Required) Secret Key. The key or password used to uniquely identify this configuration object.<br>    loop_detect_mult  = optional(number) # (Optional) Loop Detection Multiplier. Allowed range is "1"-"255". Type: String.<br>    loop_protect_act  = optional(string) # (Optional) Loop Protection Action. Allowed values are "port-disable","none". Type: String.<br>    tx_freq           = optional(number) # (Optional) Transmission Frequency. Sets the transmission frequency of the instance advertisements. Allowed range is "0"-"300". Type: String.(Note: For value less than "2", loop_protect_act attribute needs to be "port-disable", Accepted Range of tx_freq is 100ms to 300s so total value of tx_freq & tx_freq_msec should in Accepted range.)<br>    tx_freq_msec      = optional(number) # (Optional) Transmission Frequency. Sets the transmission frequency of mcp advertisements in milliseconds Allowed range is "0"-"999". Type: String.(Note: For value "0" of tx_freq, range of tx_freq_msec is "100"-"999".)<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->