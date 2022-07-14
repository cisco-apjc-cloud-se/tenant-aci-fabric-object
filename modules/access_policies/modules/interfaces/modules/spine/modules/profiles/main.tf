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
- Fabric -> Access Policies -> Interfaces -> Spine -> Profiles -> Spine Interface Profile == aci_spine_interface_profile

NO Terraform support for:
-
*/

locals {
  ### Profile Name => ID Map ###
  profile_map = merge({
    for k,p in var.profiles.interface_profiles :
      k => {
        name = p.name
        type = "spine_interface_profile"
        id = module.spine_interface_profile[k].profile_id
      }
  }
  )
}

### ACI Fabric Access Policy - Interfaces - Spine - Profiles - Interface Profile Module ###
module "spine_interface_profile" {
  for_each = var.profiles.interface_profiles
  source = "./modules/spine_interface_profile"

  ### VARIABLES ###
  interface_profile           = each.value
  interface_policy_group_map  = var.interface_policy_group_map

}
