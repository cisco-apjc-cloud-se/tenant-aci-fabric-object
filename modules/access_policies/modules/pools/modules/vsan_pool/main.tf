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
  vsan_pool = defaults(var.vsan_pool, {
    use_existing  = false
    alloc_mode    = "static"
  })
}

data "aci_vsan_pool" "pool" {
  count = local.vsan_pool.use_existing == true ? 1 : 0

  name        = local.vsan_pool.name
  alloc_mode  = local.vsan_pool.alloc_mode
}

resource "aci_vsan_pool" "pool" {
  count   = local.vsan_pool.use_existing == false ? 1 : 0

  name        = local.vsan_pool.name
  description = local.vsan_pool.description
  alloc_mode  = local.vsan_pool.alloc_mode
  annotation  = local.vsan_pool.annotation
  name_alias  = local.vsan_pool.name_alias
}

module "ranges" {
  for_each  = local.vsan_pool.ranges
  source    = "./modules/ranges"

  ### VARIABLES ###
  pool_dn = local.vsan_pool.use_existing == true ? data.aci_vsan_pool.pool[0].id : aci_vsan_pool.pool[0].id
  range   = each.value
}
