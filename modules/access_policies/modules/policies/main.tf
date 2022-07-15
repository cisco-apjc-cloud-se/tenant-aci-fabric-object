terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

locals {
  # ### Pool Name => ID Map ###
  # vlan_pool_map = {
  #   for k,p in var.pools.vlan_pools :
  #     k => {
  #       name = p.pool_name
  #       id = module.access_policies[k].pool_id
  #     }
}

### ACI Fabric Access Policy - Global Policies Module ###
module "global" {
  source = "./modules/global"

  ### VARIABLES ###
  global      = var.policies.global
  domain_map  = var.domain_map
}

### ACI Fabric Access Policy - Interface Policies Module ###
module "interface" {
  source = "./modules/interface"

  ### VARIABLES ###
  interface   = var.policies.interface
}

### ACI Fabric Access Policy - Switch Policies Module ###
module "switch" {
  source = "./modules/switch"

  ### VARIABLES ###
  switch   = var.policies.switch
}
