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
- Fabric -> Access Policies -> Switches -> Spine -> Profiles -> Spine Profile == aci_spine_profile

NO Terraform support for:
-
*/

### ACI Fabric Access Policy - Interfaces - Spine - Profiles - Spine Profile Module ###
module "spine_profile" {
  for_each = var.profiles.spine_profile
  source = "./modules/spine_profile"

  ### VARIABLES ###
  spine_profile           = each.value
  switch_policy_group_map = var.switch_policy_group_map

}
