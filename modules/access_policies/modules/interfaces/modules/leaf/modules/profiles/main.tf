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
- Fabric -> Access Policies -> Interfaces -> Leaf -> Profiles -> Leaf Interface Profile == aci_leaf_interface_profile
- Fabric -> Access Policies -> Interfaces -> Leaf -> Profiles -> FEX Interface Profile == aci_fex_profile

NO Terraform support for:
-
*/

locals {
  ### Profile Name => ID Map ###
  profile_map = merge({
    for k,p in var.profiles.fex_profiles :
      k => {
        name = p.name
        type = "fex_profile"
        id = module.fex_profile[k].profile_id
      }
  },
  {
    for k,p in var.profiles.interface_profiles :
      k => {
        name = p.name
        type = "leaf_interface_profile"
        id = module.leaf_interface_profile[k].profile_id
      }
  }
  )
}

### ACI Fabric Access Policy - Interfaces - Leaf - Profiles - FEX Profile Module ###
module "fex_profile" {
  for_each = var.profiles.fex_profiles
  source = "./modules/fex_profile"

  ### VARIABLES ###
  fex_profile                 = each.value
  interface_policy_group_map  = var.interface_policy_group_map
}

### ACI Fabric Access Policy - Interfaces - Leaf - Profiles - Interface Profile Module ###
module "leaf_interface_profile" {
  for_each = var.profiles.interface_profiles
  source = "./modules/leaf_interface_profile"

  ### VARIABLES ###
  interface_profile           = each.value
  interface_policy_group_map  = var.interface_policy_group_map

}
