output "profile_id" {
  value = local.interface_profile.use_existing == true ? data.aci_spine_interface_profile.profile[0].id : aci_spine_interface_profile.profile[0].id
}
