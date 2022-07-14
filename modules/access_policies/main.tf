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
NOTE:

No Terraform support for:
- Modules
*/

locals {}

### ACI Fabric Access Policy - Domains Module ###
module "domains" {
  source = "./modules/domains"

  ### Variables ###
  domains = var.access_policies.domains
  vlan_pool_map = module.pools.vlan_pool_map
  vsan_pool_map = module.pools.vsan_pool_map
}

### ACI Fabric Access Policy - Interfaces Module ###
module "interfaces" {
  source = "./modules/interfaces"

  ### Variables ###
  interfaces            = var.access_policies.interfaces
  aaep_map              = module.policies.aaep_map
  interface_policy_map  = module.policies.interface_policy_map
}

### ACI Fabric Access Policy - Policies Module ###
module "policies" {
  source = "./modules/policies"

  ### Variables ###
  policies    = var.access_policies.policies
  domain_map  = module.domains.domain_map
}

### ACI Fabric Access Policy - Pools Module ###
module "pools" {
  source = "./modules/pools"

  ### Variables ###
  pools = var.access_policies.pools
}

### ACI Fabric Access Policy - Switches Module ###
module "switches" {
  source = "./modules/switches"

  ### Variables ###
  switches                    = var.access_policies.switches
  switch_policy_map           = module.policies.switch_policy_map
  interface_policy_map        = module.policies.interface_policy_map
  leaf_interface_profile_map  = module.interfaces.leaf_interface_profile_map
  spine_interface_profile_map = module.interfaces.spine_interface_profile_map
}
