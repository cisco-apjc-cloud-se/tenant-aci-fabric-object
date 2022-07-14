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
  leaf              = var.switches.leaf
  switch_policy_map = var.switch_policy_map
  # aaep_map              = var.aaep_map
}

### ACI Fabric Access Policy - Switches - Spine Module ###
module "spine" {
  source = "./modules/spine"

  ### VARIABLES ###
  spine             = var.switches.spine
  switch_policy_map = var.switch_policy_map
  # aaep_map              = var.aaep_map
}
