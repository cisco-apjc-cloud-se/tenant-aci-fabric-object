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
| <a name="module_vpc_domain"></a> [vpc\_domain](#module\_vpc\_domain) | ./modules/vpc_domain | n/a |
| <a name="module_vpc_protection_group"></a> [vpc\_protection\_group](#module\_vpc\_protection\_group) | ./modules/vpc_protection_group | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_switch"></a> [switch](#input\_switch) | n/a | <pre>object({<br>    vpc_domains = map(object({<br>      name        = string # (Required) Name of object VPC Domain Policy.<br>      annotation  = optional(string) # (Optional) Annotation of object VPC Domain Policy.<br>      dead_intvl  = optional(string) # (Optional) The VPC peer dead interval time of object VPC Domain Policy. Range: "5" - "600". Default value is "200".<br>      name_alias  = optional(string) # (Optional) Name Alias of object VPC Domain Policy.<br>      description = optional(string) # (Optional) Description of object VPC Domain Policy.<br>    }))<br>    vpc_protection_groups = map(object({<br>      name                              = string # (Required) Name of Object VPC Explicit Protection Group.<br>      switch1                           = string # (Required) Node Id of switch 1 to attach.<br>      switch2                           = string # (Required) Node Id of switch 2 to attach.<br>      annotation                        = optional(string) # (Optional) Annotation for object VPC Explicit Protection Group.<br>      vpc_domain_policy                 = optional(string) # (Optional) VPC domain policy name.<br>      vpc_explicit_protection_group_id  = optional(number) # (Optional) Explicit protection group ID. Integer values are allowed between 1-1000. default value is "0".<br>    }))<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_map"></a> [policy\_map](#output\_policy\_map) | n/a |
<!-- END_TF_DOCS -->