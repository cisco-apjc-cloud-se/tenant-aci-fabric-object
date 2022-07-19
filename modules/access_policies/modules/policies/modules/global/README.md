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
| <a name="module_aaep"></a> [aaep](#module\_aaep) | ./modules/aaep | n/a |
| <a name="module_error_disable_recovery"></a> [error\_disable\_recovery](#module\_error\_disable\_recovery) | ./modules/error_disable_recovery | n/a |
| <a name="module_mcp_instance"></a> [mcp\_instance](#module\_mcp\_instance) | ./modules/mcp_instance | n/a |
| <a name="module_qos_class"></a> [qos\_class](#module\_qos\_class) | ./modules/qos_class | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_map"></a> [domain\_map](#input\_domain\_map) | n/a | `any` | n/a | yes |
| <a name="input_global"></a> [global](#input\_global) | n/a | <pre>object({<br>    aaeps = map(object({<br>      name                = string<br>      use_existing        = optional(bool)<br>      description         = optional(string)<br>      annotation          = optional(string)<br>      name_alias          = optional(string)<br>      enable_infra_vlan   = bool<br>      associated_domains  = map(object({<br>        use_existing  = optional(bool)<br>        name          = string<br>        type          = optional(string)<br>      }))<br>    }))<br>    qos_class = optional(object({<br>      name_alias            = optional(string) # "qos_instance_alias"<br>      description           = optional(string) # "From Terraform"<br>      etrap_age_timer       = optional(number) # "0"<br>      etrap_bw_thresh       = optional(number) # "0"<br>      etrap_byte_ct         = optional(number) # "0"<br>      etrap_st              = optional(string) # "no"<br>      fabric_flush_interval = optional(number) # "500"<br>      fabric_flush_st       = optional(string) # "no"<br>      annotation            = optional(string) # "orchestrator:terraform"<br>      ctrl                  = optional(string) # "none"<br>      uburst_spine_queues   = optional(number) # "10"<br>      uburst_tor_queues     = optional(number) # "10"<br>    }))<br>    error_disable_recovery = optional(object({<br>      annotation          = optional(string)<br>      err_dis_recov_intvl = optional(number)<br>      name_alias          = optional(string)<br>      description         = optional(string)<br>      event-bpduguard     = optional(string)<br>      event-ep-move       = optional(string)<br>      event-mcp-loop      = optional(string)<br>    }))<br>    mcp_instance = optional(object({<br>      annotation        = optional(string) # (Optional) Annotation of object MCP Instance Policy.<br>      admin_st          = optional(string) # (Optional) Admin State. The administrative state of the object or policy. Allowed values are "disabled", "enabled". Type: String.<br>      description       = optional(string) # (Optional) Description for object MCP Instance Policy. Type: String.<br>      name_alias        = optional(string) # (Optional) Name Alias for object MCP Instance Policy. Type: String.<br>      ctrl              = optional(list(string)) # (Optional) Controls. The control state. Allowed values are "pdu-per-vlan", "stateful-ha". Type: List.<br>      init_delay_time   = optional(number) # (Optional) Init Delay Time. Allowed range is "0"-"1800". Type: String.<br>      key               = string # (Required) Secret Key. The key or password used to uniquely identify this configuration object.<br>      loop_detect_mult  = optional(number) # (Optional) Loop Detection Multiplier. Allowed range is "1"-"255". Type: String.<br>      loop_protect_act  = optional(string) # (Optional) Loop Protection Action. Allowed values are "port-disable","none". Type: String.<br>      tx_freq           = optional(number) # (Optional) Transmission Frequency. Sets the transmission frequency of the instance advertisements. Allowed range is "0"-"300". Type: String.(Note: For value less than "2", loop_protect_act attribute needs to be "port-disable", Accepted Range of tx_freq is 100ms to 300s so total value of tx_freq & tx_freq_msec should in Accepted range.)<br>      tx_freq_msec      = optional(number) # (Optional) Transmission Frequency. Sets the transmission frequency of mcp advertisements in milliseconds Allowed range is "0"-"999". Type: String.(Note: For value "0" of tx_freq, range of tx_freq_msec is "100"-"999".)<br>    }))<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aaep_map"></a> [aaep\_map](#output\_aaep\_map) | n/a |
<!-- END_TF_DOCS -->