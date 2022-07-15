terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

### ACI Fabric - Inventory - Pod Module ###
module "pod" {
  for_each = var.inventory.pods
  source = "./modules/pods"

  ### Variables ###
  pod = each.value
}
