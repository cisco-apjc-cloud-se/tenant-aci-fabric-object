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
- Fabric -> Access Policies -> Switches -> Leaf -> Policy Groups -> Access Switch Policy Group == aci_access_switch_policy_group

NO Terraform support for:
-
*/

locals {
  ### Policy Group Name => ID Map ###
  policy_grp_map = merge({
    for k,p in var.policy_groups.access_switches :
      k => {
        name = p.name
        type = "access_switch"
        id = module.access_switch[k].policy_grp_id
      }
  }
  )
}

### ACI Fabric Access Policy - Switches - Leaf - Policy Group - Access Switch Module ###
module "access_switch" {
  for_each = var.policy_groups.access_switches
  source = "./modules/access_switch"

  ### VARIABLES ###
  access_switch     = each.value
  switch_policy_map = var.switch_policy_map
}
