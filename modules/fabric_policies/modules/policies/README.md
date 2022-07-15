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
| <a name="module_interface"></a> [interface](#module\_interface) | ./modules/interface | n/a |
| <a name="module_monitoring"></a> [monitoring](#module\_monitoring) | ./modules/monitoring | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_policies"></a> [policies](#input\_policies) | n/a | <pre>object({<br>    interface = object({<br>      l3_interface_policies = map(object({<br>        name        = string # (Required) Name of object L3 Interface Policy.<br>        annotation  = optional(string) # (Optional) Annotation for object L3 Interface Policy.<br>        bfd_isis    = optional(string) # (Optional) BFD ISIS Configuration for object L3 Interface Policy. Allowed values are "disabled" and "enabled". Default value is "disabled".<br>        name_alias  = optional(string) # (Optional) Name alias for object L3 Interface Policy.<br>        description = optional(string) # (Optional) Description for object L3 Interface Policy.<br>      }))<br>    })<br>    monitoring = object({<br>      fabric_node_control_policies = map(object({<br>        name        = string # (Required) Name of object Fabric Node Control.<br>        annotation  = optional(string) # (Optional) Annotation of object Fabric Node Control.<br>        control     = optional(string) # (Optional) Fabric node control bitmask of object Fabric Node Control. Allowed values are "Dom" and "None". Default value is "None".<br>        feature_sel = optional(string) # (Optional) Feature Selection of object Fabric Node Control. Allowed values are "analytics", "netflow" and "telemetry". Default value is "telemetry".<br>        description = optional(string) # (Optional) Description of object Fabric Node Control.<br>        name_alias  = optional(string) # (Optional) Name Alias of object Fabric Node Control.<br>      }))<br>    })<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->