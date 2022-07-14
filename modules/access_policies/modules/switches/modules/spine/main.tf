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
-
*/

### ACI Fabric Access Policy - Switches - Spine - Policy Group Module ###
module "policy_groups" {
  source = "./modules/policy_groups"

  ### VARIABLES ###
  policy_groups         = var.spine.policy_groups
  interface_policy_map  = var.interface_policy_map
}

### ACI Fabric Access Policy - Switches - Spine - Profiles Module ###
module "profiles" {
  source = "./modules/profiles"

  ### VARIABLES ###
  profiles                = var.spine.profiles
  switch_policy_group_map = module.policy_groups.switch_policy_group_map
}
