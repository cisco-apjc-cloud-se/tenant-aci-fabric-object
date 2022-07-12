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
NOTE:

No Terraform support for:
- Modules
*/

locals {}

### ACI Fabric Access Policy - Pools Module ###
module "pools" {
  source = "./modules/pools"

  ### Variables ###
  pools = var.access_policies.pools
}

### ACI Fabric Access Policy - Policies Module ###
module "policies" {
  source = "./modules/policies"

  ### Variables ###
  policies = var.access_policies.policies
}
