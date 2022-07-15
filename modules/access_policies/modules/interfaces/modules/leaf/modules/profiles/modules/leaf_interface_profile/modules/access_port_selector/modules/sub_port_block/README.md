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
| [aci_access_sub_port_block.block](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/access_sub_port_block) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_port_selector_dn"></a> [access\_port\_selector\_dn](#input\_access\_port\_selector\_dn) | n/a | `any` | n/a | yes |
| <a name="input_sub_port_block"></a> [sub\_port\_block](#input\_sub\_port\_block) | n/a | <pre>object({<br>    name          = string # (Required) Name of Object access sub port block.<br>    annotation    = optional(string) # (Optional) Annotation for object access sub port block.<br>    description   = optional(string) # (Optional) Description for object access sub port block.<br>    from_card     = number # (Optional) From card. Allowed Values are between 1 to 100. Default Value is "1".<br>    from_port     = number # (Optional) Port block from port Allowed Values are between 1 to 127. Default Value is "1".<br>    from_sub_port = number # (Optional) From sub port for object access sub port block. Allowed Values are between 1 to 64. Default Value is "1".<br>    name_alias    = optional(string) # (Optional) Name alias for object access sub port block.<br>    to_card       = number # (Optional) To card. Allowed Values are between 1 to 100. Default Value is "1".<br>    to_port       = number # (Optional) To port. Allowed Values are between 1 to 127. Default Value is "1".<br>    to_sub_port   = number # (Optional) To sub port for object access sub port block. Allowed Values are between 1 to 64. Default Value is "1".<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->