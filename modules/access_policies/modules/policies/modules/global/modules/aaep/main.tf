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
  aaep = defaults(var.aaep, {
    use_existing = false
    associated_domains = {
      use_existing = false
    }
  })

  existing_phy_domains = {
    for k,d in local.aaep.associated_domains :
    k => d
    if d.use_existing == true && d.type == "physical"
  }
  existing_l3_domains = {
    for k,d in local.aaep.associated_domains :
    k => d
    if d.use_existing == true && d.type == "layer3"
  }
  existing_fc_domains = {
    for k,d in local.aaep.associated_domains :
    k => d
    if d.use_existing == true && d.type == "fc"
  }
}

### Optionaly load existing AAEP ###
data "aci_attachable_access_entity_profile" "aaep" {
  count = local.aaep.use_existing == true ? 1 : 0
  name = local.aaep.name
}

### Optionaly build new AAEP ###
resource "aci_attachable_access_entity_profile" "aaep" {
  count = local.aaep.use_existing == false ? 1 : 0
  description = var.aaep.description
  name        = var.aaep.name
  annotation  = var.aaep.annotation
  name_alias  = var.aaep.name_alias
  # relation_infra_rs_dom_p = local.domain_id_list
}

### Optionaly set Infra VLAN ###
resource "aci_vlan_encapsulationfor_vxlan_traffic" "infra" {
  count = local.aaep.use_existing == false ? (local.aaep.enable_infra_vlan == true ? 1 : 0) : 0
  attachable_access_entity_profile_dn  = aci_attachable_access_entity_profile.aaep.id
}

### Optionaly load existing domains ###
data "aci_physical_domain" "domain" {
  for_each = local.existing_phy_domains
  name = each.value.name
}

data "aci_l3_domain_profile" "domain" {
  for_each = local.existing_l3_domains
  name = each.value.name
}

data "aci_fc_domain" "domain" {
  for_each = local.existing_fc_domains
  name = each.value.name
}

### Associate Domain to AAEP ###
resource "aci_aaep_to_domain" "domain" {
  for_each = local.aaep.associated_domains
  attachable_access_entity_profile_dn = local.aaep.use_existing == true ? data.aci_attachable_access_entity_profile.aaep[0].id : aci_attachable_access_entity_profile.aaep[0].id
  domain_dn                           = each.value.use_existing == false ? var.domain_map[each.value.name].id : each.value.type == "physical" ? data.aci_physical_domain.domain[each.value.name].id : each.value.type == "layer3" ? data.aci_l3_domain_profile.domain[each.value.name].id : each.value.type == "fc" ? data.aci_fc_profile.domain[each.value.name].id : null
}
