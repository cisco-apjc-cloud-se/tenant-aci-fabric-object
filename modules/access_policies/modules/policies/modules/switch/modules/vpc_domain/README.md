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
| [aci_vpc_domain_policy.vpc](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/vpc_domain_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vpc_domain"></a> [vpc\_domain](#input\_vpc\_domain) | n/a | <pre>object({<br>    name        = string # (Required) Name of object VPC Domain Policy.<br>    annotation  = optional(string) # (Optional) Annotation of object VPC Domain Policy.<br>    dead_intvl  = optional(string) # (Optional) The VPC peer dead interval time of object VPC Domain Policy. Range: "5" - "600". Default value is "200".<br>    name_alias  = optional(string) # (Optional) Name Alias of object VPC Domain Policy.<br>    description = optional(string) # (Optional) Description of object VPC Domain Policy.<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | n/a |
<!-- END_TF_DOCS -->