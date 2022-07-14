terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_spine_port_policy_group" "group" {
  name        = var.spine_port.name
  description = var.spine_port.description
  annotation  = var.spine_port.annotation
  name_alias  = var.spine_port.name_alias

  ### Attached Entity Profile ###
  relation_infra_rs_att_ent_p   = var.spine_port.aaep_name != null ? var.aaep_map[var.spine_port.aaep_name].id : null

  ### Link Level Policy ###
  relation_infra_rs_h_if_pol    = var.spine_port.level_link_policy_name != null ? var.interface_policy_map[var.spine_port.level_link_policy_name].id : null

  ### CDP Interface Policy ###
  relation_infra_rs_cdp_if_pol  = var.spine_port.cdp_intf_policy_name != null ? var.interface_policy_map[var.spine_port.cdp_intf_policy_name].id : null

  ### Unused ###
  # relation_infra_rs_copp_if_pol - (Optional) Relation to class coppIfPol. Cardinality - N_TO_ONE. Type - String.
  # relation_infra_rs_macsec_if_pol - (Optional) Relation to class macsecIfPol. Cardinality - N_TO_ONE. Type - String.
}
