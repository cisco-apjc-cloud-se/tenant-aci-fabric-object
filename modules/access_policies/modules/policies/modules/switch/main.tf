terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

/*
NOTE: Supported Policies Objects in Terraform
- Fabric -> Access Policies -> Policies -> Switch -> VPC Domain == aci_vpc_domain_policy
- Fabric -> Access Policies -> Policies -> Switch -> VPC Explicit Protection Group == aci_vpc_explicit_protection_group

NO support for:
- 802.1x Node Authentication
- BFD
- BFD MH
- CoPP
- Equipment Flash Config
- Fast Link Failover
- Fibre Channel Node
- Fibre Channel SAN
- Forwarding Scale Profile
- NetFlow Node
- PoE Node
- PTP Node Policy
- Spanning Tree
- Synchronous Ethernet Node
*/

locals {
  ### Policy Name => ID Map ###
  policy_map = merge({
    for k,p in var.switch.vpc_domain :
      k => {
        name = p.name
        type = "vpc_domain"
        id = module.vpc_domain[k].policy_id
      }
  },
  {
    for k,p in var.switch.vpc_protection_group :
      k => {
        name = p.name
        type = "vpc_protection_group"
        id = module.vpc_protection_group[k].policy_id
      }
  }
  )
}

### ACI Fabric Access Policy - Switch - VPC Domain Policy Module ###
module "vpc_domain" {
  for_each = var.switch.vpc_domain_policies
  source = "./modules/vpc_domain"

  ### VARIABLES ###
  vpc_domain = each.value
}

### ACI Fabric Access Policy - Switch - VPC Explicit Protection Group Policy Module ###
module "vpc_protection_group" {
  for_each = var.switch.vpc_protection_groups
  source = "./modules/vpc_protection_group"

  ### VARIABLES ###
  vpc_protection_group = each.value
}
