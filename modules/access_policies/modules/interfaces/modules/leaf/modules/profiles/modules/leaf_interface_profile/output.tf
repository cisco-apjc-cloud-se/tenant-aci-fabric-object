output "profile_id" {
  value = local.interface_profile.use_existing == true ? data.aci_leaf_interface_profile.profile[0].id : aci_leaf_interface_profile.profile[0].id
}
