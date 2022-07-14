terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

### ACI Fabric Fabric Policy - Monitoring - Fabric Node Control Module ###
module "fabric_node_control" {
  for_each = var.monitoring.fabric_node_control_policies
  source = "./modules/fabric_node_control"

  ### Variables ###
  fabric_node_control = each.value
}
