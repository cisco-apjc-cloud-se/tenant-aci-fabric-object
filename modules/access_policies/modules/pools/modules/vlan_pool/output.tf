output "pool_id" {
  value = local.vlan_pool.use_existing == true ? data.aci_vlan_pool.pool[0].id : aci_vlan_pool.pool[0].id
}
