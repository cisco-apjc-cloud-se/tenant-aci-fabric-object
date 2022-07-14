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
- Fabric -> Access Policies -> Switches -> Spine -> Policy Groups -> Spine Switch Policy Group == aci_spine_switch_policy_group

NO Terraform support for:
-
*/

locals {
  ### Policy Group Name => ID Map ###
  policy_grp_map = merge({
    for k,p in var.policy_groups.spine_switches :
      k => {
        name = p.name
        type = "spine_switch"
        id = module.spine_switch[k].policy_grp_id
      }
  }
  )
}

### ACI Fabric Access Policy - Switches - Spine - Policy Group - Spine Switch Module ###
module "spine_switch" {
  for_each = var.policy_groups.spine_switches
  source = "./modules/spine_switch"

  ### VARIABLES ###
  spine_switch          = each.value
  interface_policy_map  = var.interface_policy_map
}
