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
| <a name="module_blacklist"></a> [blacklist](#module\_blacklist) | ./modules/blacklist | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_leaf"></a> [leaf](#input\_leaf) | n/a | <pre>object({<br>    node_id             = number<br>    interface_blacklist = optional(list(string))<br>  })</pre> | n/a | yes |
| <a name="input_pod_id"></a> [pod\_id](#input\_pod\_id) | n/a | `number` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->