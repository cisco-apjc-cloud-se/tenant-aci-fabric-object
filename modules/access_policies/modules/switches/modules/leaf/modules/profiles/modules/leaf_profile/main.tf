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
  leaf_profile = defaults(var.leaf_profile, {
    use_existing = false
    interface_profiles = {
      use_existing = false
    }
  })
  existing_leaf_interface_profiles = {
    for k,p in local.leaf_profile.interface_profiles :
      k => p
    if p.use_existing == true && p.type == "leaf_interface_profile"
  }
  existing_fex_profiles = {
    for k,p in local.leaf_profile.interface_profiles :
      k => p
    if p.use_existing == true && p.type == "fex_profile"
  }
  new_profiles = {
    for k,p in local.leaf_profile.interface_profiles :
      k => p
    if p.use_existing == false
  }
}

### Optionally load existing interface profiles ###
data "aci_leaf_interface_profile" "profile" {
  for_each = local.existing_leaf_interface_profiles
  name = each.value.name
}

data "aci_fex_profile" "profile" {
  for_each = local.existing_fex_profiles
  name = each.value.name
}


### Optionally load existing profile ###
data "aci_leaf_profile" "profile" {
  count = local.leaf_profile.use_existing == true ? 1 : 0
  name        = local.leaf_profile.name
}

resource "aci_leaf_profile" "profile" {
  count = local.leaf_profile.use_existing == false ? 1 : 0
  name        = local.leaf_profile.name
  description = local.leaf_profile.description
  annotation  = local.leaf_profile.annotation
  name_alias  = local.leaf_profile.name_alias

  ### Module Profiles ###
  # relation_infra_rs_acc_card_p - (Optional) Relation to class infraAccCardP. Cardinality - N_TO_M. Type - Set of String.

  ### Access Interface Profiles ###
  # relation_infra_rs_acc_port_p - (Optional) Relation to class infraAccPortP. Cardinality - N_TO_M. Type - Set of String.
  relation_infra_rs_acc_port_p = concat(
  [
    for k,p in local.new_profiles :
      var.interface_profile_map[p.name].id
  ],
  [
    for k,p in local.existing_leaf_interface_profiles :
      data.aci_leaf_interface_profile.profile[k].id
  ],
  [
    for k,p in local.existing_fex_profiles :
      data.aci_fex_profile.profile[k].id
  ]
  )

}

module "leaf_selector" {
  for_each = local.leaf_profile.leaf_selectors
  source = "./modules/leaf_selector"

  ### VARIABLES ###
  leaf_profile_dn         = local.leaf_profile.use_existing == true ? data.aci_leaf_profile.profile[0].id : aci_leaf_profile.profile[0].id
  switch_policy_group_map = var.switch_policy_group_map
  leaf_selector           = each.value
}
