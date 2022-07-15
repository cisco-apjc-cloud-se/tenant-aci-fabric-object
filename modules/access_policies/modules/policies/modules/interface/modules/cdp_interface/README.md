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
| [aci_cdp_interface_policy.cdp](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/cdp_interface_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cdp_interface"></a> [cdp\_interface](#input\_cdp\_interface) | n/a | <pre>object({<br>    name        = string # (Required) Name of Object cdp interface policy.<br>    admin_st    = optional(string) # (Optional) Administrative state. Allowed values: "enabled", "disabled". Default value is "enabled".<br>    annotation  = optional(string) # (Optional) Annotation for object cdp interface policy.<br>    name_alias  = optional(string) # (Optional) Name alias for object cdp interface policy.<br>    description = optional(string) # (Optional) Description for object cdp interface policy.<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | n/a |
<!-- END_TF_DOCS -->