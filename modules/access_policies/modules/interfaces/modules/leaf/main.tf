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
NO Terraform support for:
- Overrides
*/

### ACI Fabric Access Policy - Interfaces - Leaf - Policy Group Module ###
module "policy_groups" {
  source = "./modules/policy_groups"

  ### VARIABLES ###
  policy_groups         = var.policy_groups
  interface_policy_map  = var.interface_policy_map
  aaep_map              = var.aaep_map
}

### ACI Fabric Access Policy - Interfaces - Leaf - Profiles Module ###
module "profiles" {
  source = "./modules/profiles"

  ### VARIABLES ###
  profiles                    = var.profiles
  interface_policy_group_map  = module.policy_groups.interface_policy_group_map
}
