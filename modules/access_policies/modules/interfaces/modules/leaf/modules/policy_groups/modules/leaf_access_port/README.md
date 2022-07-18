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
| [aci_leaf_access_port_policy_group.group](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/leaf_access_port_policy_group) | resource |
| [aci_attachable_access_entity_profile.aaep](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/attachable_access_entity_profile) | data source |
| [aci_cdp_interface_policy.cdp](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/cdp_interface_policy) | data source |
| [aci_fabric_if_pol.link](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/fabric_if_pol) | data source |
| [aci_interface_fc_policy.fc](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/interface_fc_policy) | data source |
| [aci_l2_interface_policy.l2](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/l2_interface_policy) | data source |
| [aci_lldp_interface_policy.lldp](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/lldp_interface_policy) | data source |
| [aci_miscabling_protocol_interface_policy.mcp](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/miscabling_protocol_interface_policy) | data source |
| [aci_port_security_policy.portsec](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/port_security_policy) | data source |
| [aci_spanning_tree_interface_policy.stp](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/spanning_tree_interface_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aaep_map"></a> [aaep\_map](#input\_aaep\_map) | n/a | `any` | n/a | yes |
| <a name="input_interface_policy_map"></a> [interface\_policy\_map](#input\_interface\_policy\_map) | n/a | `any` | n/a | yes |
| <a name="input_leaf_access_port"></a> [leaf\_access\_port](#input\_leaf\_access\_port) | n/a | <pre>object({<br>    name                    = string<br>    description             = optional(string)<br>    annotation              = optional(string)<br>    name_alias              = optional(string)<br>    aaep_profile = object({<br>      use_existing  = optional(bool)<br>      name          = optional(string)<br>    })<br>    link_level_policy = object({<br>      use_existing  = optional(bool)<br>      name          = optional(string)<br>    })<br>    lldp_intf_policy = object({<br>      use_existing  = optional(bool)<br>      name          = optional(string)<br>    })<br>    cdp_intf_policy = object({<br>      use_existing  = optional(bool)<br>      name          = optional(string)<br>    })<br>    mcp_intf_policy = object({<br>      use_existing  = optional(bool)<br>      name          = optional(string)<br>    })<br>    l2_intf_policy = object({<br>      use_existing  = optional(bool)<br>      name          = optional(string)<br>    })<br>    fc_intf_policy = object({<br>      use_existing  = optional(bool)<br>      name          = optional(string)<br>    })<br>    stp_intf_policy = object({<br>      use_existing  = optional(bool)<br>      name          = optional(string)<br>    })<br>    port_sec_policy = object({<br>      use_existing  = optional(bool)<br>      name          = optional(string)<br>    })<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_grp_id"></a> [policy\_grp\_id](#output\_policy\_grp\_id) | n/a |
<!-- END_TF_DOCS -->