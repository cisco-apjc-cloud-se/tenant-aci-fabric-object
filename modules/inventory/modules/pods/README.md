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
| <a name="module_leaf"></a> [leaf](#module\_leaf) | ./modules/leaf | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_pod"></a> [pod](#input\_pod) | n/a | <pre>object({<br>    pod_id        = number<br>    leaf_switches = map(object({<br>      node_id             = number<br>      interface_blacklist = optional(list(string))<br>    }))<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->