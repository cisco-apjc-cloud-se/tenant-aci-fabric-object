terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_spine_switch_policy_group" "group" {
  name        = var.spine_switch.name
  annotation  = var.spine_switch.annotation
  name_alias  = var.spine_switch.name_alias
  description = var.spine_switch.description

  ### LLDP Interface Policy ###
  relation_infra_rs_spine_p_grp_to_lldp_if_pol  = var.spine_switch.lldp_intf_policy_name != null ? var.interface_policy_map[var.spine_switch.lldp_intf_policy_name].id : null

  ### CDP Interface Policy ###
  relation_infra_rs_spine_p_grp_to_cdp_if_pol   = var.spine_switch.cdp_intf_policy_name != null ? var.interface_policy_map[var.spine_switch.cdp_intf_policy_name].id : null

  # relation_infra_rs_iacl_spine_profile - (Optional) Represents the relation to a CoPP Prefilter Profile for Spines (class iaclSpineProfile). Relationship the CoPP Prefilter Spine profile to be applied on spines Type: String.
  # relation_infra_rs_spine_bfd_ipv4_inst_pol - (Optional) Represents the relation to a BFD Ipv4 Instance Policy (class bfdIpv4InstPol). Relationship to BFD Ipv4 Instance Policy Type: String.
  # relation_infra_rs_spine_bfd_ipv6_inst_pol - (Optional) Represents the relation to a BFD Ipv6 Instance Policy (class bfdIpv6InstPol). Relationship to BFD Ipv6 Instance Policy Type: String.
  # relation_infra_rs_spine_copp_profile - (Optional) Represents the relation to a CoPP Profile for Spines (class coppSpineProfile). Relationship the CoPP profile to be applied on spines Type: String.
}
