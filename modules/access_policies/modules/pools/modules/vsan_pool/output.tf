output "pool_id" {
  value = local.vsan_pool.use_existing == true ? data.aci_vsan_pool.pool[0].id : aci_vsan_pool.pool[0].id
}
