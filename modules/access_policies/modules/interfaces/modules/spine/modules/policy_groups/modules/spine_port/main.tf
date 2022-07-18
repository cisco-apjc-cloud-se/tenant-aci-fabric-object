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
  spine_port = defaults(var.spine_port, {
    aaep_profile = {
      use_existing = false
    }
    link_level_policy = {
      use_existing = false
    }
    cdp_intf_policy = {
      use_existing = false
    }
  })
}

### Optionally load existing policies ###
data "aci_attachable_access_entity_profile" "aaep" {
  count = local.spine_port.aaep_profile.use_existing == true ? 1 : 0
  name = local.spine_port.aaep_profile.name
}

data "aci_fabric_if_pol" "link" {
  count = local.spine_port.link_level_policy.use_existing == true ? 1 : 0
  name = local.spine_port.link_level_policy.name
}

data "aci_cdp_interface_policy" "cdp" {
  count = local.spine_port.cdp_intf_policy.use_existing == true ? 1 : 0
  name = local.spine_port.cdp_intf_policy.name
}

### Build new Spine Port Policy Group ###
resource "aci_spine_port_policy_group" "group" {
  name        = local.spine_port.name
  description = local.spine_port.description
  annotation  = local.spine_port.annotation
  name_alias  = local.spine_port.name_alias

  ### Attached Entity Profile ###
  relation_infra_rs_att_ent_p   = local.spine_port.aaep_profile.name != null ? local.spine_port.aaep_profile.use_existing == true ? data.aci_attachable_access_entity_profile.aaep[0].id : var.aaep_map[local.spine_port.aaep_profile.name].id : null

  ### Link Level Policy ###
  relation_infra_rs_h_if_pol    = local.spine_port.link_level_policy.name != null ? local.spine_port.link_level_policy.use_existing == true ? data.aci_fabric_if_pol.link[0].id : var.interface_policy_map[local.spine_port.link_level_policy.name].id : null

  ### CDP Interface Policy ###
  relation_infra_rs_cdp_if_pol  = local.spine_port.cdp_intf_policy.name != null ? local.spine_port.cdp_intf_policy.use_existing == true ? data.aci_cdp_interface_policy.cdp[0].id : var.interface_policy_map[local.spine_port.cdp_intf_policy.name].id : null

  ### Unused ###
  # relation_infra_rs_copp_if_pol - (Optional) Relation to class coppIfPol. Cardinality - N_TO_ONE. Type - String.
  # relation_infra_rs_macsec_if_pol - (Optional) Relation to class macsecIfPol. Cardinality - N_TO_ONE. Type - String.
}
