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
  ### Pool Name => ID Map ###
  vlan_pool_map = {
    for k,p in var.pools.vlan_pools :
      k => {
        name = p.pool_name
        id = module.access_policies[k].pool_id
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
