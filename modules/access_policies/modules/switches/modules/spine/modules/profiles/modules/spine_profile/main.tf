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
  spine_profile = defaults(var.spine_profile, {
    use_existing = false
    interface_profiles = {
      use_existing = false
    }
  })
  existing_spine_interface_profiles = {
    for k,p in local.spine_profile.interface_profiles :
      k => p
    if p.use_existing == true
  }
  new_profiles = {
    for k,p in local.spine_profile.interface_profiles :
      k => p
    if p.use_existing == false
  }
}

### Optionally load existing interface profiles ###
data "aci_spine_interface_profile" "profile" {
  for_each = local.existing_spine_interface_profiles
  name = each.value.name
}

### Optionally load existing profile ###
data "aci_spine_profile" "profile" {
  count = local.spine_profile.use_existing == true ? 1 : 0
  name = local.spine_profile.name
}

### Optionally build new profile ###
resource "aci_spine_profile" "profile" {
  count = local.spine_profile.use_existing == false ? 1 : 0
  name        = local.spine_profile.name
  description = local.spine_profile.description
  annotation  = local.spine_profile.annotation
  name_alias  = local.spine_profile.name_alias

  ### Interface Profiles ###
  relation_infra_rs_sp_acc_port_p = concat(
  [
    for k,p in local.new_profiles :
      var.interface_profile_map[p.name].id
  ],
  [
    for k,p in local.existing_spine_interface_profiles :
      data.aci_spine_interface_profile.profile[k].id
  ]
  )

  # relation_infra_rs_sp_acc_port_p - (Optional) Relation to class infraSpAccPortP. Cardinality - N_TO_M. Type - Set of String.
}

module "spine_selector" {
  for_each = local.spine_profile.spine_selectors
  source = "./modules/spine_selector"

  ### VARIABLES ###
  spine_profile_dn        = local.spine_profile.use_existing == true ? data.aci_spine_profile.profile[0].id : aci_spine_profile.profile[0].id
  spine_selector          = each.value
  switch_policy_group_map = var.switch_policy_group_map
}
