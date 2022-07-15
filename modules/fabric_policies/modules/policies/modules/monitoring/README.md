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
| <a name="module_fabric_node_control"></a> [fabric\_node\_control](#module\_fabric\_node\_control) | ./modules/fabric_node_control | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_monitoring"></a> [monitoring](#input\_monitoring) | n/a | <pre>object({<br>    fabric_node_control_policies = map(object({<br>      name        = string # (Required) Name of object Fabric Node Control.<br>      annotation  = optional(string) # (Optional) Annotation of object Fabric Node Control.<br>      control     = optional(string) # (Optional) Fabric node control bitmask of object Fabric Node Control. Allowed values are "Dom" and "None". Default value is "None".<br>      feature_sel = optional(string) # (Optional) Feature Selection of object Fabric Node Control. Allowed values are "analytics", "netflow" and "telemetry". Default value is "telemetry".<br>      description = optional(string) # (Optional) Description of object Fabric Node Control.<br>      name_alias  = optional(string) # (Optional) Name Alias of object Fabric Node Control.<br>    }))<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->