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
- Fabric -> Access Policies -> Policies -> Global -> QOS Class == aci_qos_instance_policy
- Fabric -> Access Policies -> Policies -> Global -> Attachable Access Entity Profile == aci_attachable_access_entity_profile

NO support for:
- PTP User Profile
- DHCP Relay
*/

locals {
  # ### Pool Name => ID Map ###
  # vlan_pool_map = {
  #   for k,p in var.pools.vlan_pools :
  #     k => {
  #       name = p.pool_name
  #       id = module.access_policies[k].pool_id
  #     }
  }
