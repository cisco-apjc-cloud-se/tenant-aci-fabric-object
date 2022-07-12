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
