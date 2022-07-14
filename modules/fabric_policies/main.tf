terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

### ACI Fabric Fabric Policy - Policies Module ###
module "policies" {
  source = "./modules/policies"

  ### Variables ###
  policies = var.fabric_policies.policies
}
