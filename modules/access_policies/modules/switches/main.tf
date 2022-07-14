terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

### ACI Fabric Access Policy - Switches - Leaf Module ###
module "leaf" {
  source = "./modules/leaf"

  ### VARIABLES ###
  leaf                  = var.switch.leaf
  switch_policy_map     = var.switch_policy_map
  interface_policy_map  = var.interface_policy_map # ?
  interface_profile_map = var.interface_profile_map
}

### ACI Fabric Access Policy - Switches - Spine Module ###
module "spine" {
  source = "./modules/spine"

  ### VARIABLES ###
  spine                 = var.switch.spine
  switch_policy_map     = var.switch_policy_map
  interface_policy_map  = var.interface_policy_map
  interface_profile_map = var.interface_profile_map
}
