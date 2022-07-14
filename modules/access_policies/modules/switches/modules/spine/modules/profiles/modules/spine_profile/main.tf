terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_spine_profile" "profile" {
  name        = var.spine_profile.name
  description = var.spine_profile.description
  annotation  = var.spine_profile.annotation
  name_alias  = var.spine_profile.name_alias

  ### Interface Profiles ###
  relation_infra_rs_sp_acc_port_p = [
    for profile in var.spine_profile.interface_profiles :
      var.interface_profile_map[profile].id
  ]
  # relation_infra_rs_sp_acc_port_p - (Optional) Relation to class infraSpAccPortP. Cardinality - N_TO_M. Type - Set of String.
}

module "spine_selector" {
  for_each = var.spine_profile.spine_selectors
  source = "./modules/spine_selector"

  ### VARIABLES ###
  spined_profile_dn       = aci_spine_profile.profile.id
  spine_selector          = each.value
  switch_policy_group_map = var.switch_policy_group_map
}
