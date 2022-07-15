terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_vpc_domain_policy" "vpc" {
  name        = var.vpc_domain.name
  annotation  = var.vpc_domain.annotation
  dead_intvl  = var.vpc_domain.dead_intvl
  name_alias  = var.vpc_domain.name_alias
  description = var.vpc_domain.description
}
