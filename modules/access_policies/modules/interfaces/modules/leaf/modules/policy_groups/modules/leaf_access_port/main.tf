terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_leaf_access_port_policy_group" "group" {
  name                                    = var.leaf_access_port.name
  description                             = var.leaf_access_port.name
  annotation                              = var.leaf_access_port.name
  name_alias                              = var.leaf_access_port.name

  ## Basic Settings ##

  ### Attached Entity Profile ###
  relation_infra_rs_att_ent_p             = var.leaf_access_port.aaep_name != null ? var.aaep_map[var.leaf_access_port.aaep_name].id : null

  ### Link Level Policy ###
  relation_infra_rs_h_if_pol              = var.leaf_access_port.link_level_policy_name != null ? var.interface_policy_map[var.leaf_access_port.link_level_policy_name].id : null

  ### LLDP Interface Policy ###
  relation_infra_rs_lldp_if_pol           = var.leaf_access_port.lldp_intf_policy_name != null ? var.interface_policy_map[var.leaf_access_port.lldp_intf_policy_name].id : null

  ### CDP Interface Policy ###
  relation_infra_rs_cdp_if_pol            = var.leaf_access_port.cdp_intf_policy_name != null ? var.interface_policy_map[var.leaf_access_port.cdp_intf_policy_name].id : null


  ## Advanced Settings ##

  ### MCP Interface Policy ###
  relation_infra_rs_mcp_if_pol            = var.leaf_access_port.mcp_intf_policy_name != null ? var.interface_policy_map[var.leaf_access_port.mcp_intf_policy_name].id : null

  ### L2 Interface Policy ###
  relation_infra_rs_l2_if_pol             = var.leaf_access_port.l2_intf_policy_name != null ? var.interface_policy_map[var.leaf_access_port.l2_intf_policy_name].id : null

  ### FC Interface Policy ###
  relation_infra_rs_fc_if_pol             = var.leaf_access_port.fc_intf_policy_name != null ? var.interface_policy_map[var.leaf_access_port.fc_intf_policy_name].id : null

  ### STP Interface Policy ###
  relation_infra_rs_stp_if_pol            = var.leaf_access_port.stp_intf_policy_name != null ? var.interface_policy_map[var.leaf_access_port.stp_intf_policy_name].id : null

  ### Port Security Policy ###
  relation_infra_rs_l2_port_security_pol  = var.leaf_access_port.port_sec_policy_name != null ? var.interface_policy_map[var.leaf_access_port.port_sec_policy_name].id : null


  ### Currently Unsupported ###

  # relation_infra_rs_span_v_src_grp - (Optional) Relation to class spanVSrcGrp. Cardinality - N_TO_M. Type - Set of String.
  # relation_infra_rs_stormctrl_if_pol - (Optional) Relation to class stormctrlIfPol. Cardinality - N_TO_ONE. Type - String.
  # relation_infra_rs_poe_if_pol - (Optional) Relation to class poeIfPol. Cardinality - N_TO_ONE. Type - String.
  # relation_infra_rs_macsec_if_pol - (Optional) Relation to class macsecIfPol. Cardinality - N_TO_ONE. Type - String.
  # relation_infra_rs_qos_dpp_if_pol - (Optional) Relation to class qosDppPol. Cardinality - N_TO_ONE. Type - String.
  # relation_infra_rs_netflow_monitor_pol - (Optional) Relation to class netflowMonitorPol. Cardinality - N_TO_M. Type - Set of Map.
  #  flt_type - (Required) Netflow IP filter type. Allowed values: "ce", "ipv4", "ipv6".
  #  target_dn - (Required) Distinguished name of target Netflow Monitor object.
  # relation_infra_rs_l2_port_auth_pol - (Optional) Relation to class l2PortAuthPol. Cardinality - N_TO_ONE. Type - String.
  # relation_infra_rs_copp_if_pol - (Optional) Relation to class coppIfPol. Cardinality - N_TO_ONE. Type - String.
  # relation_infra_rs_span_v_dest_grp - (Optional) Relation to class spanVDestGrp. Cardinality - N_TO_M. Type - Set of String.
  # relation_infra_rs_dwdm_if_pol - (Optional) Relation to class dwdmIfPol. Cardinality - N_TO_ONE. Type - String.
  # relation_infra_rs_qos_pfc_if_pol - (Optional) Relation to class qosPfcIfPol. Cardinality - N_TO_ONE. Type - String.
  # relation_infra_rs_qos_sd_if_pol - (Optional) Relation to class qosSdIfPol. Cardinality - N_TO_ONE. Type - String.
  # relation_infra_rs_mon_if_infra_pol - (Optional) Relation to class monInfraPol. Cardinality - N_TO_ONE. Type - String.
  # relation_infra_rs_qos_ingress_dpp_if_pol - (Optional) Relation to class qosDppPol. Cardinality - N_TO_ONE. Type - String.
  # relation_infra_rs_qos_egress_dpp_if_pol - (Optional) Relation to class qosDppPol. Cardinality - N_TO_ONE. Type - String.
  # relation_infra_rs_l2_inst_pol - (Optional) Relation to class l2InstPol. Cardinality - N_TO_ONE. Type - String.

  }
