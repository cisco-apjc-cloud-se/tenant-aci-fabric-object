terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_vpc_explicit_protection_group" "group" {
  name                              = var.vpc_protection_group.name
  annotation                        = var.vpc_protection_group.annotation
  switch1                           = var.vpc_protection_group.switch1
  switch2                           = var.vpc_protection_group.switch2
  vpc_domain_policy                 = var.vpc_protection_group.vpc_domain_policy
  vpc_explicit_protection_group_id  = var.vpc_protection_group.vpc_explicit_protection_group_id
}
