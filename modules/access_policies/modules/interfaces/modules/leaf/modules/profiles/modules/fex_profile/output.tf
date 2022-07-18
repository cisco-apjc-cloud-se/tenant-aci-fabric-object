output "profile_id" {
  value = local.fex_profile.use_existing == true ? data.aci_fex_profile.profile[0].id : aci_fex_profile.profile[0].id
}
