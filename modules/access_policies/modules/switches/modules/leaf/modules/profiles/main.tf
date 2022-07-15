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
- Fabric -> Access Policies -> Switches -> Leaf -> Profiles -> Leaf Profile == aci_leaf_profile

NO Terraform support for:
-
*/

### ACI Fabric Access Policy - Switch - Leaf - Profiles - Leaf Profile Module ###
module "leaf_profile" {
  for_each = var.profiles.leaf_profiles
  source = "./modules/leaf_profile"

  ### VARIABLES ###
  leaf_profile            = each.value
  switch_policy_group_map = var.switch_policy_group_map
  interface_profile_map   = var.interface_profile_map
}
