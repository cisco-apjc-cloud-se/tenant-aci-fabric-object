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
| [aci_spanning_tree_interface_policy.stp](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/spanning_tree_interface_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_spanning_tree"></a> [spanning\_tree](#input\_spanning\_tree) | n/a | <pre>object({<br>    name        = string # (Required) Name of object Spanning Tree Interface Policy.<br>    annotation  = optional(string) # (Optional) Annotation of object Spanning Tree Interface Policy.<br>    name_alias  = optional(string) # (Optional) Name alias of object Spanning Tree Interface Policy.<br>    description = optional(string) # (Optional) Description of object Spanning Tree Interface Policy.<br>    ctrl        = optional(list(string)) # (Optional) Interface controls. Allowed values are "bpdu-filter", "bpdu-guard", "unspecified". The default value is "unspecified". Unspecified value should not be added along with other allowed values. Type: List.<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | n/a |
<!-- END_TF_DOCS -->