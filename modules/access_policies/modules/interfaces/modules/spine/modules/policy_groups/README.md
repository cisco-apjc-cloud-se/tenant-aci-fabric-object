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
| <a name="module_spine_port"></a> [spine\_port](#module\_spine\_port) | ./modules/spine_port | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aaep_map"></a> [aaep\_map](#input\_aaep\_map) | n/a | `any` | n/a | yes |
| <a name="input_interface_policy_map"></a> [interface\_policy\_map](#input\_interface\_policy\_map) | n/a | `any` | n/a | yes |
| <a name="input_policy_groups"></a> [policy\_groups](#input\_policy\_groups) | n/a | <pre>object({<br>    spine_ports = map(object({<br>      name                    = string<br>      description             = optional(string)<br>      annotation              = optional(string)<br>      name_alias              = optional(string)<br>      aaep_name               = optional(string)<br>      link_level_policy_name  = optional(string)<br>      cdp_intf_policy_name    = optional(string)<br>    }))<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->