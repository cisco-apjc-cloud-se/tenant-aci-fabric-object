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

### ACI Fabric Access Policy - Interfaces - Spine - Profiles - Interface Profile Module ###
module "spine_interface_profile" {
  for_each = var.profiles.interface_profiles
  source = "./modules/spine_interface_profile"

  ### VARIABLES ###
  interface_profile           = each.value
  interface_policy_group_map  = var.interface_policy_group_map

}
