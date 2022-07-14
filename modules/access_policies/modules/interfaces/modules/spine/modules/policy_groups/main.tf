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
- Fabric -> Access Policies -> Interfaces -> Spine -> Policy Groups -> Spine Access Port == aci_spine_port_policy_group

NO Terraform support for:
-
*/

### ACI Fabric Access Policy - Interfaces - Spine - Policy Group - Spine Port Module ###
module "spine_port" {
  for_each = var.policy_groups.spine_ports
  source = "./modules/spine_port"

  ### VARIABLES ###
  spine_port            = each.value
  interface_policy_map  = var.interface_policy_map
  aaep_map              = var.aaep_map
}
