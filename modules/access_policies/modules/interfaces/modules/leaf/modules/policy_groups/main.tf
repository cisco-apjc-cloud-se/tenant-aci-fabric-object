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
- Fabric -> Access Policies -> Interfaces -> Leaf -> Policy Groups -> Leaf Access Port == aci_leaf_access_port_policy_group
- Fabric -> Access Policies -> Interfaces -> Leaf -> Policy Groups -> PC Interface == aci_leaf_access_bundle_policy_group
- Fabric -> Access Policies -> Interfaces -> Leaf -> Policy Groups -> VPC Interface == aci_leaf_access_bundle_policy_group
- Fabric -> Access Policies -> Interfaces -> Leaf -> Policy Groups -> Leaf Breakout Port Group == aci_leaf_breakout_port_group

NO Terraform support for:
- PC/VPC Override
- FC Interface
- FC PC Interface
*/


locals {
  ### Policy Group Name => ID Map ###
  policy_grp_map = merge({
    for k,p in var.policy_groups.leaf_access_bundles :
      k => {
        name = p.name
        type = "bundle"
        id = module.leaf_access_bundle[k].policy_grp_id
      }
  },
  {
    for k,p in var.policy_groups.leaf_access_ports :
      k => {
        name = p.name
        type = "port"
        id = module.leaf_access_port[k].policy_grp_id
      }
  },
  {
    for k,p in var.policy_groups.leaf_breakout_ports :
      k => {
        name = p.name
        type = "breakout"
        id = module.leaf_breakout[k].policy_grp_id
      }
  }
  )
}

### ACI Fabric Access Policy - Interfaces - Leaf - Policy Group - Leaf Bundle (PC/vPC) Port Module ###
module "leaf_access_bundle" {
  for_each = var.policy_groups.leaf_access_bundles
  source = "./modules/leaf_access_bundle"

  ### VARIABLES ###
  leaf_access_bundle    = each.value
  interface_policy_map  = var.interface_policy_map
  aaep_map              = var.aaep_map
}

### ACI Fabric Access Policy - Interfaces - Leaf - Policy Group - Leaf Access Port Module ###
module "leaf_access_port" {
  for_each = var.policy_groups.leaf_access_ports
  source = "./modules/leaf_access_port"

  ### VARIABLES ###
  leaf_access_port      = each.value
  interface_policy_map  = var.interface_policy_map
  aaep_map              = var.aaep_map
}

### ACI Fabric Access Policy - Interfaces - Leaf - Policy Group - Leaf Breakout Port Module ###
module "leaf_breakout" {
  for_each = var.policy_groups.leaf_breakout_ports
  source = "./modules/leaf_breakout"

  ### VARIABLES ###
  breakout = each.value
}
