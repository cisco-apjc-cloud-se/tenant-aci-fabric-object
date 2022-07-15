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
| [aci_port_security_policy.portsec](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/port_security_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_port_security"></a> [port\_security](#input\_port\_security) | n/a | <pre>object({<br>    name        = string # (Required) Name of Object port security policy.<br>    description = optional(string) # (Optional) Description for object port security policy.<br>    annotation  = optional(string) # (Optional) Annotation for object port security policy.<br>    maximum     = optional(number) # (Optional) Port Security Maximum. Allowed value range is "0" - "12000". Default is "0".<br>    name_alias  = optional(string) # (Optional) Name alias for object port security policy.<br>    timeout     = optional(number) # (Optional) Amount of time between authentication attempts. Allowed value range is "60" - "3600". Default is "60".<br>    violation   = optional(string) # (Optional) Port Security Violation. default value is "protect". Allowed value: "protect"<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | n/a |
<!-- END_TF_DOCS -->