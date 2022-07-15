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
| [aci_qos_instance_policy.qos](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/qos_instance_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_qos_class"></a> [qos\_class](#input\_qos\_class) | n/a | <pre>object({<br>    name_alias            = optional(string) # "qos_instance_alias"<br>    description           = optional(string) # "From Terraform"<br>    etrap_age_timer       = optional(number) # "0"<br>    etrap_bw_thresh       = optional(number) # "0"<br>    etrap_byte_ct         = optional(number) # "0"<br>    etrap_st              = optional(string) # "no"<br>    fabric_flush_interval = optional(number) # "500"<br>    fabric_flush_st       = optional(string) # "no"<br>    annotation            = optional(string) # "orchestrator:terraform"<br>    ctrl                  = optional(string) # "none"<br>    uburst_spine_queues   = optional(number) # "10"<br>    uburst_tor_queues     = optional(number) # "10"<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->