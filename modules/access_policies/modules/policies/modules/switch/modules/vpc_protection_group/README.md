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
| [aci_vpc_explicit_protection_group.group](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/vpc_explicit_protection_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vpc_protection_group"></a> [vpc\_protection\_group](#input\_vpc\_protection\_group) | n/a | <pre>object({<br>    name                              = string # (Required) Name of Object VPC Explicit Protection Group.<br>    switch1                           = string # (Required) Node Id of switch 1 to attach.<br>    switch2                           = string # (Required) Node Id of switch 2 to attach.<br>    annotation                        = optional(string) # (Optional) Annotation for object VPC Explicit Protection Group.<br>    vpc_domain_policy                 = optional(string) # (Optional) VPC domain policy name.<br>    vpc_explicit_protection_group_id  = optional(number) # (Optional) Explicit protection group ID. Integer values are allowed between 1-1000. default value is "0".<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | n/a |
<!-- END_TF_DOCS -->