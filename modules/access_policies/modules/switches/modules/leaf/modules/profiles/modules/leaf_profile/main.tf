terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_leaf_profile" "profile" {
  name        = var.leaf_profile.name
  description = var.leaf_profile.description
  annotation  = var.leaf_profile.annotation
  name_alias  = var.leaf_profile.name_alias
  # relation_infra_rs_acc_card_p - (Optional) Relation to class infraAccCardP. Cardinality - N_TO_M. Type - Set of String.
  # relation_infra_rs_acc_port_p - (Optional) Relation to class infraAccPortP. Cardinality - N_TO_M. Type - Set of String.
}

module "leaf_selector" {
  for_each = var.leaf_profile.leaf_selectors
  source = "./modules/leaf_selector"

  ### VARIABLES ###
  leaf_profile_dn = aci_leaf_profile.profile.id
  leaf_selector   = each.value
}
