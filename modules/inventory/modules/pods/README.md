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
| <a name="module_fabric_member"></a> [fabric\_member](#module\_fabric\_member) | ./modules/fabric_member | n/a |
| <a name="module_leaf_switches"></a> [leaf\_switches](#module\_leaf\_switches) | ./modules/leaf_switches | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_pod"></a> [pod](#input\_pod) | n/a | <pre>object({<br>    pod_id        = number<br>    leaf_switches = map(object({<br>      node_id             = number<br>      interface_blacklist = optional(list(string))<br>    }))<br>    fabric_members = map(object({<br>      serial      = string # (Required) Serial Number for the new Fabric Node Member.<br>      name        = string # (Required) Name of Fabric Node member.<br>      annotation  = optional(string) # (Optional) Specifies the annotation of a Fabric Node member.<br>      description = optional(string) # (Optional) Specifies the description of a Fabric Node member.<br>      ext_pool_id = optional(number) # (Optional) external pool ID for object Fabric Node member. Default value: "0".<br>      fabric_id   = optional(number) # (Optional) Fabric ID for the new Fabric Node Member. Default value: "1".<br>      name_alias  = optional(string) # (Optional) Name alias for object Fabric Node member.<br>      node_id     = number # (Optional) Node ID Number for the new Fabric Node Member. Allowed value range: "101" - "4000". Default value: "0".<br>      node_type   = optional(string) # (Optional) Node type for object Fabric Node member. Allowed values: "unspecified", "remote-leaf-wan". Default value: "unspecified".<br>      role        = string # (Optional) Role for the new Fabric Node Member. Allowed values: "unspecified", "leaf", "spine". Default value: "unspecified"<br>    }))<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->