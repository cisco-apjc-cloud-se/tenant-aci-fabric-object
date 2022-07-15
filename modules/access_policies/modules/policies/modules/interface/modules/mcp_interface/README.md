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
| [aci_miscabling_protocol_interface_policy.mcp](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/miscabling_protocol_interface_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_mcp_interface"></a> [mcp\_interface](#input\_mcp\_interface) | n/a | <pre>object({<br>    name        = string # (Required) Name of Object miscabling protocol interface policy.<br>    admin_st    = optional(string) # (Optional) Administrative state of the object or policy. Allowed values are "enabled" and "disabled". Default is "enabled".<br>    description = optional(string) # (Optional) Description for object miscabling protocol interface policy.<br>    annotation  = optional(string) # (Optional) Annotation for object miscabling protocol interface policy.<br>    name_alias  = optional(string) # (Optional) Name alias for object miscabling protocol interface policy.<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | n/a |
<!-- END_TF_DOCS -->