output "policy_grp_id" {
  value = local.access_switch.use_existing == true ? data.aci_access_switch_policy_group.group[0].id : aci_access_switch_policy_group.group[0].id
}
