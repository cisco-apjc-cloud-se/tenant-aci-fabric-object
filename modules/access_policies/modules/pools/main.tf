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
  ### VLAN Pool Name => ID Map ###
  vlan_pool_map = {
    for k,p in var.pools.vlan_pools :
      k => {
        name = p.name
        id = module.vlan_pool[k].pool_id
      }
  }

  ### VSAN Pool Name => ID Map ###
  vsan_pool_map = {
    for k,p in var.pools.vsan_pools :
      k => {
        name = p.name
        id = module.vsan_pool[k].pool_id
      }
  }
}

### ACI Fabric Access Policy - VLAN Pool Module ###
module "vlan_pool" {
  for_each = var.pools.vlan_pools
  source = "./modules/vlan_pool"

  ### Variables ###
  vlan_pool = each.value
}

### ACI Fabric Access Policy - VSAN Pool Module ###
module "vsan_pool" {
  for_each = var.pools.vsan_pools
  source = "./modules/vsan_pool"

  ### Variables ###
  vsan_pool = each.value
}
