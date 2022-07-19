terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

/*
NOTE: Supported Policies Objects in Terraform
- Fabric -> Access Policies -> Policies -> Global -> QOS Class == aci_qos_instance_policy
- Fabric -> Access Policies -> Policies -> Global -> Attachable Access Entity Profile == aci_attachable_access_entity_profile

NO support for:
- PTP User Profile
- DHCP Relay
*/

locals {
  ### AAEP NAME => ID Map ###
  aaep_map = {
    for k,p in var.global.aaeps :
      k => {
        name = p.name
        id = module.aaep[k].aaep_id
      }
  }
}


### ACI Fabric Access Policy - Global Policy - AAEP Module ###
module "aaep" {
  for_each = var.global.aaeps
  source = "./modules/aaep"

  ### VARIABLES ###
  aaep        = each.value
  domain_map  = var.domain_map
}

### ACI Fabric Access Policy - Global Policy - QoS Policy Module ###
module "qos_class" {
  count = var.global.qos_class != null ? 1 : 0
  source = "./modules/qos_class"

  ### VARIABLES ###
  qos_class   = var.global.qos_class
}

### ACI Fabric Access Policy - Global Policy - Error Disable Recovery ###
module "error_disable_recovery" {
  count = var.global.error_disable_recovery != null ? 1 : 0
  source = "./modules/error_disable_recovery"

  ### VARIABLES ###
  error_disable_recovery   = var.global.error_disable_recovery
}

### ACI Fabric Access Policy - Global Policy - MCP Instance Policy ###
module "mcp_instance" {
  count = var.global.mcp_instance != null ? 1 : 0
  source = "./modules/mcp_instance"

  ### VARIABLES ###
  mcp_instance   = var.global.mcp_instance
}
