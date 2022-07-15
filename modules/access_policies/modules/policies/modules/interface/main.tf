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
- Fabric -> Access Policies -> Policies -> Interface -> MCP Interface == aci_miscabling_protocol_interface_policy
- Fabric -> Access Policies -> Policies -> Interface -> Port Channel== aci_lacp_policy
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
- Netflow
- PoE
- Port Channel Member
- Priority Flow Control
- Slow Drain
- Storm Control
- Synchronous Ethernet Interface
-
*/

locals {
  ### Policy Name => ID Map ###
  policy_map = merge({
    for k,p in var.interface.cdp_policies :
      k => {
        name = p.name
        type = "cdp"
        id = module.cdp_interface[k].policy_id
      }
  },
  {
    for k,p in var.interface.fc_policies :
      k => {
        name = p.name
        type = "fc"
        id = module.fc_interface[k].policy_id
      }
  },
  {
    for k,p in var.interface.l2_policies :
      k => {
        name = p.name
        type = "l2"
        id = module.l2_interface[k].policy_id
      }
  },
  {
    for k,p in var.interface.link_level_policies :
      k => {
        name = p.name
        type = "link_level"
        id = module.link_level[k].policy_id
      }
  },
  {
    for k,p in var.interface.lldp_policies :
      k => {
        name = p.name
        type = "lldp"
        id = module.lldp_interface[k].policy_id
      }
  },
  {
    for k,p in var.interface.mcp_policies :
      k => {
        name = p.name
        type = "mcp"
        id = module.mcp_interface[k].policy_id
      }
  },
  {
    for k,p in var.interface.pc_policies :
      k => {
        name = p.name
        type = "pc"
        id = module.pc_policies[k].policy_id
      }
  },
  {
    for k,p in var.interface.port_security_policies :
      k => {
        name = p.name
        type = "portsec"
        id = module.port_security[k].policy_id
      }
  },
  {
    for k,p in var.interface.stp_policies :
      k => {
        name = p.name
        type = "stp"
        id = module.spanning_tree[k].policy_id
      }
  }
  )
}

### ACI Fabric Access Policy - Interface - CDP Interface Policy Module ###
module "cdp_interface" {
  for_each = var.interface.cdp_policies
  source = "./modules/cdp_interface"

  ### VARIABLES ###
  cdp_interface = each.value
}

### ACI Fabric Access Policy - Interface - FC Interface Policy Module ###
module "fc_interface" {
  for_each = var.interface.fc_policies
  source = "./modules/fc_interface"

  ### VARIABLES ###
  fc_interface = each.value
}

### ACI Fabric Access Policy - Interface - L2 Interface Policy Module ###
module "l2_interface" {
  for_each = var.interface.l2_policies
  source = "./modules/l2_interface"

  ### VARIABLES ###
  l2_interface = each.value
}

### ACI Fabric Access Policy - Interface - Link Level Policy Module ###
module "link_level" {
  for_each = var.interface.link_level_policies
  source = "./modules/link_level"

  ### VARIABLES ###
  link_level = each.value
}

### ACI Fabric Access Policy - Interface - LLDP Interface Policy Module ###
module "lldp_interface" {
  for_each = var.interface.lldp_policies
  source = "./modules/lldp_interface"

  ### VARIABLES ###
  lldp_interface = each.value
}

### ACI Fabric Access Policy - Interface - MCP Interface Policy Module ###
module "mcp_interface" {
  for_each = var.interface.mcp_policies
  source = "./modules/mcp_interface"

  ### VARIABLES ###
  mcp_interface = each.value
}

### ACI Fabric Access Policy - Interface - Port Channel Policy Module ###
module "pc_interface" {
  for_each = var.interface.pc_policies
  source = "./modules/pc_interface"

  ### VARIABLES ###
  port_channel = each.value
}

### ACI Fabric Access Policy - Interface - Port Security Policy Module ###
module "port_security" {
  for_each = var.interface.port_security_policies
  source = "./modules/port_security"

  ### VARIABLES ###
  port_security = each.value
}

### ACI Fabric Access Policy - Interface - Spanning Tree Interface Policy Module ###
module "spanning_tree" {
  for_each = var.interface.stp_policies
  source = "./modules/spanning_tree"

  ### VARIABLES ###
  spanning_tree = each.value
}
