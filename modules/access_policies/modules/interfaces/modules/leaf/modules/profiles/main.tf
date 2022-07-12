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
