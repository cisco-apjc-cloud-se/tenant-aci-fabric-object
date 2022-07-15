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
| <a name="module_l3_interface"></a> [l3\_interface](#module\_l3\_interface) | ./modules/l3_interface | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_interface"></a> [interface](#input\_interface) | n/a | <pre>object({<br>    l3_interface_policies = map(object({<br>      name        = string # (Required) Name of object L3 Interface Policy.<br>      annotation  = optional(string) # (Optional) Annotation for object L3 Interface Policy.<br>      bfd_isis    = optional(string) # (Optional) BFD ISIS Configuration for object L3 Interface Policy. Allowed values are "disabled" and "enabled". Default value is "disabled".<br>      name_alias  = optional(string) # (Optional) Name alias for object L3 Interface Policy.<br>      description = optional(string) # (Optional) Description for object L3 Interface Policy.<br>    }))<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->