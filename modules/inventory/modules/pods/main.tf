terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

### ACI Fabric - Inventory - Pod - Leaf Module ###
module "leaf_switches" {
  for_each = var.pod.leaf_switches
  source = "./modules/leaf_switches"

  ### Variables ###
  leaf    = each.value
  pod_id  = var.pod.pod_id
}
