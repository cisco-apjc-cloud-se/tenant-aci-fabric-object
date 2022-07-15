terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

# NOTE: Both PC and vPC Interface Bundles

resource "aci_leaf_access_bundle_policy_group" "group" {
  name          = var.leaf_access_bundle.name
  annotation    = var.leaf_access_bundle.annotation
  description   = var.leaf_access_bundle.description
  lag_t         = var.leaf_access_bundle.lag_t
  name_alias    = var.leaf_access_bundle.name_alias

  ### Attached Entity Profile ###
  relation_infra_rs_att_ent_p             = var.leaf_access_bundle.aaep_name != null ? var.aaep_map[var.leaf_access_bundle.aaep_name].id : null

  ### Link Level Policy ###
  relation_infra_rs_h_if_pol              = var.leaf_access_bundle.level_link_policy_name != null ? var.interface_policy_map[var.leaf_access_bundle.level_link_policy_name].id : null

  ### LLDP Interface Policy ###
  relation_infra_rs_lldp_if_pol           = var.leaf_access_bundle.lldp_intf_policy_name != null ? var.interface_policy_map[var.leaf_access_bundle.lldp_intf_policy_name].id : null

  ### CDP Interface Policy ###
  relation_infra_rs_cdp_if_pol            = var.leaf_access_bundle.cdp_intf_policy_name != null ? var.interface_policy_map[var.leaf_access_bundle.cdp_intf_policy_name].id : null

  ### MCP Interface Policy ###
  relation_infra_rs_mcp_if_pol            = var.leaf_access_bundle.mcp_intf_policy_name != null ? var.interface_policy_map[var.leaf_access_bundle.mcp_intf_policy_name].id : null

  ### L2 Interface Policy ###
  relation_infra_rs_l2_if_pol             = var.leaf_access_bundle.l2_intf_policy_name != null ? var.interface_policy_map[var.leaf_access_bundle.l2_intf_policy_name].id : null

  ### FC Interface Policy ###
  relation_infra_rs_fc_if_pol             = var.leaf_access_bundle.fc_intf_policy_name != null ? var.interface_policy_map[var.leaf_access_bundle.fc_intf_policy_name].id : null

  ### STP Interface Policy ###
  relation_infra_rs_stp_if_pol            = var.leaf_access_bundle.stp_intf_policy_name != null ? var.interface_policy_map[var.leaf_access_bundle.stp_intf_policy_name].id : null

  ### Port Security Policy ###
  relation_infra_rs_l2_port_security_pol  = var.leaf_access_bundle.port_sec_policy_name != null ? var.interface_policy_map[var.leaf_access_bundle.port_sec_policy_name].id : null

  ### LACP Interface Policy ###
  relation_infra_rs_lacp_pol              = var.leaf_access_bundle.pc_intf_policy_name != null ? var.interface_policy_map[var.leaf_access_bundle.pc_intf_policy_name].id : null

#   relation_infra_rs_span_v_src_grp - (Optional) Relation to class spanVSrcGrp. Cardinality - N_TO_M. Type - Set of String.
#   relation_infra_rs_stormctrl_if_pol - (Optional) Relation to class stormctrlIfPol. Cardinality - N_TO_ONE. Type - String.
#   relation_infra_rs_macsec_if_pol - (Optional) Relation to class macsecIfPol. Cardinality - N_TO_ONE. Type - String.
#   relation_infra_rs_qos_dpp_if_pol - (Optional) Relation to class qosDppPol. Cardinality - N_TO_ONE. Type - String.
#   relation_infra_rs_netflow_monitor_pol - (Optional) Relation to class netflowMonitorPol. Cardinality - N_TO_M. Type - Set of Map.
#     flt_type - (Required) Netflow IP filter type. Allowed values: "ce", "ipv4", "ipv6".
#     target_dn - (Required) Distinguished name of target Netflow Monitor object.
#   relation_infra_rs_l2_port_auth_pol - (Optional) Relation to class l2PortAuthPol. Cardinality - N_TO_ONE. Type - String.
#   relation_infra_rs_copp_if_pol - (Optional) Relation to class coppIfPol. Cardinality - N_TO_ONE. Type - String.
#   relation_infra_rs_span_v_dest_grp - (Optional) Relation to class spanVDestGrp. Cardinality - N_TO_M. Type - Set of String.
#   relation_infra_rs_qos_pfc_if_pol - (Optional) Relation to class qosPfcIfPol. Cardinality - N_TO_ONE. Type - String.
#   relation_infra_rs_qos_sd_if_pol - (Optional) Relation to class qosSdIfPol. Cardinality - N_TO_ONE. Type - String.
#   relation_infra_rs_mon_if_infra_pol - (Optional) Relation to class monInfraPol. Cardinality - N_TO_ONE. Type - String.
#   relation_infra_rs_qos_ingress_dpp_if_pol - (Optional) Relation to class qosDppPol. Cardinality - N_TO_ONE. Type - String.
#   relation_infra_rs_qos_egress_dpp_if_pol - (Optional) Relation to class qosDppPol. Cardinality - N_TO_ONE. Type - String.
#   relation_infra_rs_l2_inst_pol - (Optional) Relation to class l2InstPol. Cardinality - N_TO_ONE. Type - String
}
