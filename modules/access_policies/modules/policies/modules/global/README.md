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
| <a name="module_aaep"></a> [aaep](#module\_aaep) | ./modules/aaep | n/a |
| <a name="module_qos_class"></a> [qos\_class](#module\_qos\_class) | ./modules/qos_class | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_map"></a> [domain\_map](#input\_domain\_map) | n/a | `any` | n/a | yes |
| <a name="input_global"></a> [global](#input\_global) | n/a | <pre>object({<br>    aaeps = map(object({<br>      description = optional(string)<br>      name        = string<br>      annotation  = optional(string)<br>      name_alias  = optional(string)<br>      domain_list = list(string)<br>    }))<br>    qos_class = object({<br>      name_alias            = optional(string) # "qos_instance_alias"<br>      description           = optional(string) # "From Terraform"<br>      etrap_age_timer       = optional(number) # "0"<br>      etrap_bw_thresh       = optional(number) # "0"<br>      etrap_byte_ct         = optional(number) # "0"<br>      etrap_st              = optional(string) # "no"<br>      fabric_flush_interval = optional(number) # "500"<br>      fabric_flush_st       = optional(string) # "no"<br>      annotation            = optional(string) # "orchestrator:terraform"<br>      ctrl                  = optional(string) # "none"<br>      uburst_spine_queues   = optional(number) # "10"<br>      uburst_tor_queues     = optional(number) # "10"<br>    })<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aaep_map"></a> [aaep\_map](#output\_aaep\_map) | n/a |
<!-- END_TF_DOCS -->