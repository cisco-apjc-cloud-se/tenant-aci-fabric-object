terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

/*
NOTE: Supported Policies Objects in Terraform
- Fabric -> Access Policies -> Policies -> Interface -> CDP Interface == aci_cdp_interface_policy
- Fabric -> Access Policies -> Policies -> Interface -> Fibre Channel Interface == aci_interface_fc_policy
- Fabric -> Access Policies -> Policies -> Interface -> L2 Interface == aci_l2_interface_policy
- Fabric -> Access Policies -> Policies -> Interface -> LLDP Interface == aci_lldp_interface_policy
- Fabric -> Access Policies -> Policies -> Interface -> Port Security == aci_port_security_policy
- Fabric -> Access Policies -> Policies -> Interface -> Spanning Tree Interface == aci_spanning_tree_interface_policy

NO support for:
- 802.1x Port Authentication
- CoPP Interface
- Data Plane Policing
- DWDM
- Firewall
- Link Flap
- Link Level
- Link Level Flow Control
- MACsec
- MCP Interface
- Netflow
- PoE
- Port Channel
- Port Channel Member
- Priority Flow Control
- Slow Drain
- Storm Control
- Synchronous Ethernet Interface
-
*/

locals {
  # ### Pool Name => ID Map ###
  # vlan_pool_map = {
  #   for k,p in var.pools.vlan_pools :
  #     k => {
  #       name = p.pool_name
  #       id = module.access_policies[k].pool_id
  #     }
  }
