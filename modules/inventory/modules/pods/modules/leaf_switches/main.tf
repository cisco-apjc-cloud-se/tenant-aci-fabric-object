terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

### ACI Fabric - Inventory - Pod - Leaf - Blacklist (Shutdown) Interfaces Module ###
module "blacklist" {
  source = "./modules/blacklist"

  ### VARIABLES ###
  blacklist = var.leaf.interface_blacklist
  pod_id    = var.pod_id
  node_id   = var.leaf.node_id
}
