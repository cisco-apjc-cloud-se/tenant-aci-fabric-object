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
  leaf_access_port = defaults(var.leaf_access_port, {
    aaep_profile = {
      use_existing = false
    }
    link_level_policy = {
      use_existing = false
    }
    lldp_intf_policy = {
      use_existing = false
    }
    cdp_intf_policy = {
      use_existing = false
    }
    mcp_intf_policy = {
      use_existing = false
    }
    l2_intf_policy = {
      use_existing = false
    }
    fc_intf_policy = {
      use_existing = false
    }
    stp_intf_policy = {
      use_existing = false
    }
    port_sec_policy = {
      use_existing = false
    }
  })
}

### Optionally load existing policies ###
data "aci_attachable_access_entity_profile" "aaep" {
  count = local.leaf_access_port.aaep_profile.use_existing == true ? 1 : 0
  name = local.leaf_access_port.aaep_profile.name
}

data "aci_fabric_if_pol" "link" {
  count = local.leaf_access_port.link_level_policy.use_existing == true ? 1 : 0
  name = local.leaf_access_port.link_level_policy.name
}

data "aci_lldp_interface_policy" "lldp" {
  count = local.leaf_access_port.lldp_intf_policy.use_existing == true ? 1 : 0
  name = local.leaf_access_port.lldp_intf_policy.name
}

data "aci_cdp_interface_policy" "cdp" {
  count = local.leaf_access_port.cdp_intf_policy.use_existing == true ? 1 : 0
  name = local.leaf_access_port.cdp_intf_policy.name
}

data "aci_miscabling_protocol_interface_policy" "mcp" {
  count = local.leaf_access_port.mcp_intf_policy.use_existing == true ? 1 : 0
  name = local.leaf_access_port.mcp_intf_policy.name
}

data "aci_l2_interface_policy" "l2" {
  count = local.leaf_access_port.l2_intf_policy.use_existing == true ? 1 : 0
  name = local.leaf_access_port.l2_intf_policy.name
}

data "aci_interface_fc_policy" "fc" {
  count = local.leaf_access_port.fc_intf_policy.use_existing == true ? 1 : 0
  name = local.leaf_access_port.fc_intf_policy.name
}

data "aci_spanning_tree_interface_policy" "stp" {
  count = local.leaf_access_port.stp_intf_policy.use_existing == true ? 1 : 0
  name = local.leaf_access_port.stp_intf_policy.name
}

data "aci_port_security_policy" "portsec" {
  count = local.leaf_access_port.port_sec_policy.use_existing == true ? 1 : 0
  name = local.leaf_access_port.port_sec_policy.name
}

### Build new Leaf Access Port Policy Group ###
resource "aci_leaf_access_port_policy_group" "group" {
  name                                    = local.leaf_access_port.name
  description                             = local.leaf_access_port.name
  annotation                              = local.leaf_access_port.name
  name_alias                              = local.leaf_access_port.name

  ### Attached Entity Profile ###
  relation_infra_rs_att_ent_p             = local.leaf_access_port.aaep_profile.name != null ? local.leaf_access_port.aaep_profile.use_existing == true ? data.aci_attachable_access_entity_profile.aaep[0].id : var.aaep_map[local.leaf_access_port.aaep_profile.name].id : null

  ### Link Level Policy ###
  relation_infra_rs_h_if_pol              = local.leaf_access_port.link_level_policy.name != null ? local.leaf_access_port.link_level_policy.use_existing == true ? data.aci_fabric_if_pol.link[0].id : var.interface_policy_map[local.leaf_access_port.link_level_policy.name].id : null

  ### LLDP Interface Policy ###
  relation_infra_rs_lldp_if_pol           = local.leaf_access_port.lldp_intf_policy.name != null ? local.leaf_access_port.lldp_intf_policy.use_existing == true ? data.aci_lldp_interface_policy.lldp[0].id : var.interface_policy_map[local.leaf_access_port.lldp_intf_policy.name].id : null

  ### CDP Interface Policy ###
  relation_infra_rs_cdp_if_pol            = local.leaf_access_port.cdp_intf_policy.name != null ? local.leaf_access_port.cdp_intf_policy.use_existing == true ? data.aci_cdp_interface_policy.cdp[0].id : var.interface_policy_map[local.leaf_access_port.cdp_intf_policy.name].id : null

  ### MCP Interface Policy ###
  relation_infra_rs_mcp_if_pol            = local.leaf_access_port.mcp_intf_policy.name != null ? local.leaf_access_port.mcp_intf_policy.use_existing == true ? data.aci_miscabling_protocol_interface_policy.mcp[0].id : var.interface_policy_map[local.leaf_access_port.mcp_intf_policy.name].id : null

  ### L2 Interface Policy ###
  relation_infra_rs_l2_if_pol             = local.leaf_access_port.l2_intf_policy.name != null ? local.leaf_access_port.l2_intf_policy.use_existing == true ? data.aci_l2_interface_policy.l2[0].id : var.interface_policy_map[local.leaf_access_port.l2_intf_policy.name].id : null

  ### FC Interface Policy ###
  relation_infra_rs_fc_if_pol             = local.leaf_access_port.fc_intf_policy.name != null ? local.leaf_access_port.fc_intf_policy.use_existing == true ? data.aci_interface_fc_policy.fc[0].id : var.interface_policy_map[local.leaf_access_port.fc_intf_policy.name].id : null

  ### STP Interface Policy ###
  relation_infra_rs_stp_if_pol            = local.leaf_access_port.stp_intf_policy.name != null ? local.leaf_access_port.stp_intf_policy.use_existing == true ? data.aci_spanning_tree_interface_policy.stp[0].id : var.interface_policy_map[local.leaf_access_port.stp_intf_policy.name].id : null

  ### Port Security Policy ###
  relation_infra_rs_l2_port_security_pol  = local.leaf_access_port.port_sec_policy.name != null ? local.leaf_access_port.port_sec_policy.use_existing == true ? data.aci_port_security_policy.portsec[0].id : var.interface_policy_map[local.leaf_access_port.port_sec_policy.name].id : null


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
