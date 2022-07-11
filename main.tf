terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}


### Fabric Configuration Policies Module ###
module "fabric_policies" {
  source = "./modules/fabric_policies"

  ### Variables ###
}

### Fabric Access Policies Module ###
module "access_policies" {
  source = "./modules/access_policies"

  ### Variables ###
}
