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
- Fabric -> Access Policies -> Interfaces -> Spine -> Policy Groups -> Spine Access Port == aci_spine_port_policy_group

NO Terraform support for:
-
*/

locals {
  ### Policy Group Name => ID Map ###
  policy_grp_map = merge({
    for k,p in var.policy_groups.spine_ports :
      k => {
        name = p.name
        type = "spine_port"
        id = module.spine_port[k].policy_grp_id
      }
  }
  )
}

### ACI Fabric Access Policy - Interfaces - Spine - Policy Group - Spine Port Module ###
module "spine_port" {
  for_each = var.policy_groups.spine_ports
  source = "./modules/spine_port"

  ### VARIABLES ###
  spine_port            = each.value
  interface_policy_map  = var.interface_policy_map
  aaep_map              = var.aaep_map
}
