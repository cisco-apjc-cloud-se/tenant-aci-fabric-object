terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}


### ACI Fabric Fabric Policy - Policies - Interface Module ###
module "interface" {
  source = "./modules/interface"

  ### Variables ###
  interface = var.policies.interface
}

### ACI Fabric Fabric Policy - Policies - Monitoring Module ###
module "monitoring" {
  source = "./modules/monitoring"

  ### Variables ###
  monitoring = var.policies.monitoring
}
