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
| [aci_access_port_block.block](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/access_port_block) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_port_selector_dn"></a> [access\_port\_selector\_dn](#input\_access\_port\_selector\_dn) | n/a | `any` | n/a | yes |
| <a name="input_port_block"></a> [port\_block](#input\_port\_block) | n/a | <pre>object({<br>    name        = string # (Optional) name of Object Access Port Block.<br>    annotation  = optional(string) # (Optional) Annotation for object Access Port Block.<br>    description = optional(string) # (Optional) Description for object Access Port Block.<br>    from_card   = number # (Optional) The beginning (from-range) of the card range block for the leaf access port block. Allowed value range is 1-100. Default value is "1".<br>    from_port   = number # (Optional) The beginning (from-range) of the port range block for the leaf access port block. Allowed value range is 1-127. Default value is "1".<br>    name_alias  = optional(string) # (Optional) Name alias for object Access Port Block.<br>    to_card     = number # (Optional) The end (to-range) of the card range block for the leaf access port block. Allowed value range is 1-100. Default value is "1".<br>    to_port     = number # (Optional) The end (to-range) of the port range block for the leaf access port block. Allowed value range is 1-127. Default value is "1".<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->