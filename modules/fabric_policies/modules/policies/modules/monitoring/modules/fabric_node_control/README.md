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
| [aci_fabric_node_control.policy](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/fabric_node_control) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_fabric_node_control"></a> [fabric\_node\_control](#input\_fabric\_node\_control) | n/a | <pre>object({<br>    name        = string # (Required) Name of object Fabric Node Control.<br>    annotation  = optional(string) # (Optional) Annotation of object Fabric Node Control.<br>    control     = optional(string) # (Optional) Fabric node control bitmask of object Fabric Node Control. Allowed values are "Dom" and "None". Default value is "None".<br>    feature_sel = optional(string) # (Optional) Feature Selection of object Fabric Node Control. Allowed values are "analytics", "netflow" and "telemetry". Default value is "telemetry".<br>    description = optional(string) # (Optional) Description of object Fabric Node Control.<br>    name_alias  = optional(string) # (Optional) Name Alias of object Fabric Node Control.<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->