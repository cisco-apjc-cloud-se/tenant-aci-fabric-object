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
| [aci_node_block.block](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/node_block) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_node_block"></a> [node\_block](#input\_node\_block) | n/a | <pre>object({<br>    name        = string # (Required) Name of Object node block.<br>    annotation  = optional(string) # (Optional) Annotation for object node block.<br>    description = optional(string) # (Optional) Description for object node block.<br>    from_node   = number # (Optional) From Node ID. Range from 1 to 16000. Default value is "1".<br>    name_alias  = optional(string) # (Optional) Name alias for object node block.<br>    to_node     = number # (Optional) To node ID. Range from 1 to 16000. Default value is "1".<br>  })</pre> | n/a | yes |
| <a name="input_switch_association_dn"></a> [switch\_association\_dn](#input\_switch\_association\_dn) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->