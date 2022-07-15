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
  fabric_policies = var.fabric.fabric_policies
}

### Fabric Access Policies Module ###
module "access_policies" {
  source = "./modules/access_policies"

  ### Variables ###
  access_policies = var.fabric.access_policies
}

### Fabric Inventory Module ###
module "inventory" {
  source = "./modules/inventory"

  ### Variables ###
  inventory = var.fabric.inventory
}
