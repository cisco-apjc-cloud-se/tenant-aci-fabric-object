terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

### ACI Fabric Access Policy - Interfaces - Leaf Module ###
module "leaf" {
  source = "./modules/leaf"

  ### VARIABLES ###
  leaf                  = var.interfaces.leaf
  interface_policy_map  = var.interface_policy_map
  aaep_map              = var.aaep_map
}

### ACI Fabric Access Policy - Interfaces - Spine Module ###
module "spine" {
  source = "./modules/spine"

  ### VARIABLES ###
  spine   = var.interfaces.spine
}
