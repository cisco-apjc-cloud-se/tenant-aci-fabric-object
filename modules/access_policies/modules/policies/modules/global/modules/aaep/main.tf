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
  domain_id_list = [
    for domain in var.aaep.domain_list :
      var.domain_map[domain].id
  ]
}

resource "aci_attachable_access_entity_profile" "aaep" {
  description = var.aaep.description
  name        = var.aaep.name
  annotation  = var.aaep.annotation
  name_alias  = var.aaep.name_alias
  # relation_infra_rs_dom_p = local.domain_id_list
}

resource "aci_aaep_to_domain" "domain" {
  for_each = toset(var.aaep.domain_list)
  attachable_access_entity_profile_dn = aci_attachable_access_entity_profile.aaep.id
  domain_dn                           = var.domain_map[each.value].id # aci_l3_domain_profile.fool3_domain_profile.id
}

resource "aci_vlan_encapsulationfor_vxlan_traffic" "infra" {
  count = var.aaep.enable_infra_vlan == true ? 1 : 0
  attachable_access_entity_profile_dn  = aci_attachable_access_entity_profile.aaep.id
}
