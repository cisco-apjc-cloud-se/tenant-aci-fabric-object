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
| [aci_error_disable_recovery.policy](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/error_disable_recovery) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_error_disable_recovery"></a> [error\_disable\_recovery](#input\_error\_disable\_recovery) | n/a | <pre>object({<br>    annotation          = optional(string)<br>    err_dis_recov_intvl = optional(number)<br>    name_alias          = optional(string)<br>    description         = optional(string)<br>    event-bpduguard     = optional(string)<br>    event-ep-move       = optional(string)<br>    event-mcp-loop      = optional(string)<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->