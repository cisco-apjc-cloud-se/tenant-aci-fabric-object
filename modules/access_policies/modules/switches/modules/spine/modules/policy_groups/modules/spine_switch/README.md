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
| [aci_spine_switch_policy_group.group](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/spine_switch_policy_group) | resource |
| [aci_cdp_interface_policy.cdp](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/cdp_interface_policy) | data source |
| [aci_lldp_interface_policy.lldp](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/lldp_interface_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_interface_policy_map"></a> [interface\_policy\_map](#input\_interface\_policy\_map) | n/a | `any` | n/a | yes |
| <a name="input_spine_switch"></a> [spine\_switch](#input\_spine\_switch) | n/a | <pre>object({<br>    name                  = string # (Required) Name of object Spine Switch Policy Group.<br>    annotation            = optional(string) # (Optional) Annotation of object Spine Switch Policy Group.<br>    name_alias            = optional(string) # (Optional) Name alias for object Spine Switch Policy Group.<br>    description           = optional(string) # (Optional) Description for object Spine Switch Policy Group.<br>    lldp_intf_policy = object({<br>      use_existing  = optional(bool)<br>      name          = optional(string)<br>    })<br>    cdp_intf_policy = object({<br>      use_existing  = optional(bool)<br>      name          = optional(string)<br>    })<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_grp_id"></a> [policy\_grp\_id](#output\_policy\_grp\_id) | n/a |
<!-- END_TF_DOCS -->