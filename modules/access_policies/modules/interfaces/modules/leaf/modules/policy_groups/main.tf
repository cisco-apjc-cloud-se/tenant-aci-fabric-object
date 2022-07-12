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
- Fabric -> Access Policies -> Interfaces -> Leaf -> Policy Groups -> Leaf Access Port == aci_leaf_access_port_policy_group
- Fabric -> Access Policies -> Interfaces -> Leaf -> Policy Groups -> PC Interface == aci_leaf_access_bundle_policy_group
- Fabric -> Access Policies -> Interfaces -> Leaf -> Policy Groups -> VPC Interface == aci_leaf_access_bundle_policy_group
- Fabric -> Access Policies -> Interfaces -> Leaf -> Policy Groups -> Leaf Breakout Port Group == aci_leaf_breakout_port_group

NO Terraform support for:
- PC/VPC Override
- FC Interface
- FC PC Interface
*/
