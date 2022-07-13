terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

### ACI Fabric Access Policy - Physical Domain Module ###
module "physical_domain" {
  for_each = var.domains.physical_domains
  source = "./modules/physical_domain"

  ### Variables ###
  physical_domain = each.value
  vlan_pool_map   = var.vlan_pool_map
}

### ACI Fabric Access Policy - Layer 3 Domain Module ###
module "l3_domain" {
  for_each = var.domains.l3_domains
  source = "./modules/l3_domain"

  ### Variables ###
  l3_domain       = each.value
  vlan_pool_map   = var.vlan_pool_map
}

### ACI Fabric Access Policy - FC Domain Module ###
module "fc_domain" {
  for_each = var.domains.fc_domains
  source = "./modules/fc_domain"

  ### Variables ###
  fc_domain       = each.value
  vlan_pool_map   = var.vlan_pool_map
  vsan_pool_map   = var.vsan_pool_map
}
