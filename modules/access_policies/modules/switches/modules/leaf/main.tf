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

### ACI Fabric Access Policy - Switches - Leaf - Policy Group Module ###
module "policy_groups" {
  source = "./modules/policy_groups"

  ### VARIABLES ###
  policy_groups     = var.leaf.policy_groups
  switch_policy_map = var.switch_policy_map
}

### ACI Fabric Access Policy - Switches - Leaf - Profiles Module ###
module "profiles" {
  source = "./modules/profiles"

  ### VARIABLES ###
  profiles                = var.leaf.profiles
  switch_policy_group_map = module.policy_groups.switch_policy_group_map
  interface_profile_map   = var.interface_profile_map
}
