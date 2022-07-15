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
  leaf                  = var.switches.leaf
  switch_policy_map     = var.switch_policy_map
  # interface_policy_map  = var.interface_policy_map
  interface_profile_map = var.leaf_interface_profile_map
}

### ACI Fabric Access Policy - Switches - Spine Module ###
module "spine" {
  source = "./modules/spine"

  ### VARIABLES ###
  spine                 = var.switches.spine
  # switch_policy_map     = var.switch_policy_map
  interface_policy_map  = var.interface_policy_map
  interface_profile_map = var.spine_interface_profile_map
}
