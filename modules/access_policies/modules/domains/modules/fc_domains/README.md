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
| [aci_fc_domain.domain](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/fc_domain) | resource |
| [aci_vlan_pool.pool](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/vlan_pool) | data source |
| [aci_vsan_pool.pool](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/data-sources/vsan_pool) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_fc_domain"></a> [fc\_domain](#input\_fc\_domain) | n/a | <pre>object({<br>    name       = string<br>    annotation = optional(string)<br>    name_alias = optional(string)<br>    vsan_pool  = object({<br>      use_existing  = optional(bool)<br>      name          = string<br>      alloc_mode    = optional(string)<br>    })<br>    vlan_pool  = object({<br>      use_existing  = optional(bool)<br>      name          = string<br>      alloc_mode    = optional(string)<br>    })<br>    # relation_infra_rs_vlan_ns - (Optional) Relation to class fvnsVlanInstP. Cardinality - N_TO_ONE. Type - String.<br>    # relation_fc_rs_vsan_ns - (Optional) Relation to class fvnsVsanInstP. Cardinality - N_TO_ONE. Type - String.<br>    # relation_fc_rs_vsan_attr - (Optional) Relation to class fcVsanAttrP. Cardinality - N_TO_ONE. Type - String.<br>    # relation_infra_rs_vlan_ns_def - (Optional) Relation to class fvnsAInstP. Cardinality - N_TO_ONE. Type - String.<br>    # relation_infra_rs_vip_addr_ns - (Optional) Relation to class fvnsAddrInst. Cardinality - N_TO_ONE. Type - String.<br>    # relation_infra_rs_dom_vxlan_ns_def - (Optional) Relation to class fvnsAInstP. Cardinality - N_TO_ONE. Type - String.<br>    # relation_fc_rs_vsan_attr_def - (Optional) Relation to class fcVsanAttrP. Cardinality - N_TO_ONE. Type - String.<br>    # relation_fc_rs_vsan_ns_def - (Optional) Relation to class fvnsAVsanInstP. Cardinality - N_TO_ONE. Type - String.<br>  })</pre> | n/a | yes |
| <a name="input_vlan_pool_map"></a> [vlan\_pool\_map](#input\_vlan\_pool\_map) | n/a | `any` | n/a | yes |
| <a name="input_vsan_pool_map"></a> [vsan\_pool\_map](#input\_vsan\_pool\_map) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_domain_id"></a> [domain\_id](#output\_domain\_id) | n/a |
<!-- END_TF_DOCS -->