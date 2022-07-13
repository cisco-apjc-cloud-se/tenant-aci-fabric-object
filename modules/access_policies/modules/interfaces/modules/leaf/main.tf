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
  for_each = var.leaf.policy_groups
  source = "./modules/policy_groups"

  ### VARIABLES ###
  policy_group          = each.value
  interface_policy_map  = var.interface_policy_map
  aaep_map              = var.aaep_map
}
