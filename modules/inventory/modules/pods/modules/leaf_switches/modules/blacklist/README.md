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
| [aci_interface_blacklist.blacklist](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/interface_blacklist) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_blacklist"></a> [blacklist](#input\_blacklist) | n/a | `list(string)` | n/a | yes |
| <a name="input_node_id"></a> [node\_id](#input\_node\_id) | n/a | `number` | n/a | yes |
| <a name="input_pod_id"></a> [pod\_id](#input\_pod\_id) | n/a | `number` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->