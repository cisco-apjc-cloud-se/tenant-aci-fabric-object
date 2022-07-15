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
| [aci_l3_interface_policy.policy](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/l3_interface_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_l3_interface"></a> [l3\_interface](#input\_l3\_interface) | n/a | <pre>object({<br>    name        = string # (Required) Name of object L3 Interface Policy.<br>    annotation  = optional(string) # (Optional) Annotation for object L3 Interface Policy.<br>    bfd_isis    = optional(string) # (Optional) BFD ISIS Configuration for object L3 Interface Policy. Allowed values are "disabled" and "enabled". Default value is "disabled".<br>    name_alias  = optional(string) # (Optional) Name alias for object L3 Interface Policy.<br>    description = optional(string) # (Optional) Description for object L3 Interface Policy.<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->