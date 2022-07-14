terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

### ACI Fabric Fabric Policy - Interface - Layer3 Interface Module ###
module "l3_interface" {
  for_each = var.interface.l3_interface_policies
  source = "./modules/l3_interface"

  ### Variables ###
  l3_interface = each.value
}
