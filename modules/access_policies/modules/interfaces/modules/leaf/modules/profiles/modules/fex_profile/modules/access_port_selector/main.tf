terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

locals {
  port_selector = defaults(var.port_selector, {
    use_existing = false
  })

  ### Determine existing group id if used ###
  existing_group_id = local.port_selector.policy_group.use_existing == true ? (local.port_selector.policy_group.type == "bundle" ? data.aci_leaf_access_bundle_policy_group.group[0].id : (local.port_selector.policy_group.type == "port" ? data.aci_leaf_access_port_policy_group.group[0].id : null ) ) : null
}

### Optionally load existing policy group ###
data "aci_leaf_access_bundle_policy_group" "group" {
  count = local.port_selector.policy_group.use_existing == true ? (local.port_selector.policy_group.type == "bundle" ? 1 : 0 ) : 0
  name = local.port_selector.policy_group.name
}

data "aci_leaf_access_port_policy_group" "group" {
  count = local.port_selector.policy_group.use_existing == true ? (local.port_selector.policy_group.type == "port" ? 1 : 0 ) : 0
  name = local.port_selector.policy_group.name
}


### Optionally load existing port selector ###
data "aci_access_port_selector" "selector" {
  count = local.port_selector.use_existing == true ? 1 : 0
  leaf_interface_profile_dn = var.leaf_interface_profile_dn # Required
  name                      = local.port_selector.name
  access_port_selector_type = "range"  # Required
}

### Optionally build new port selector ###
resource "aci_access_port_selector" "selector" {
  count = local.port_selector.use_existing == false ? 1 : 0
  leaf_interface_profile_dn = var.leaf_interface_profile_dn
  description               = local.port_selector.description
  name                      = local.port_selector.name
  access_port_selector_type = local.port_selector.access_port_selector_type
  annotation                = local.port_selector.annotation
  name_alias                = local.port_selector.name_alias

  ### Policy Group Name ###
  relation_infra_rs_acc_base_grp = local.port_selector.policy_group.name != null ? (local.port_selector.policy_group.use_existing == true ? local.existing_group_id : var.interface_policy_group_map[local.port_selector.policy_group.name].id) : null
}

module "port_block" {
  for_each = local.port_selector.port_blocks
  source = "./modules/port_block"

  ### VARIABLES ###
  access_port_selector_dn = local.port_selector.use_existing == true ? data.aci_access_port_selector.selector[0].id : aci_access_port_selector.selector[0].id
  port_block              = each.value
}

module "sub_port_block" {
  for_each = local.port_selector.sub_port_blocks
  source = "./modules/sub_port_block"

  ### VARIABLES ###
  access_port_selector_dn = local.port_selector.use_existing == true ? data.aci_access_port_selector.selector[0].id : aci_access_port_selector.selector[0].id
  sub_port_block          = each.value
}
