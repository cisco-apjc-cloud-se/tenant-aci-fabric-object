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

#   ### Determine existing group id if used ###
#   existing_group_id = local.port_selector.policy_group.use_existing == true ? (local.port_selector.policy_group.type == "bundle" ? data.aci_leaf_access_bundle_policy_group.group[0].id : (local.port_selector.policy_group.type == "port" ? data.aci_leaf_access_port_policy_group.group[0].id : null ) ) : null
}

### Optionally load existing policy group ###
data "aci_spine_port_policy_group" "group" {
  count = local.port_selector.policy_group.use_existing == true ? 1 : 0
  name = local.port_selector.policy_group.name
}

### Optionally load existing port selector ###
data "aci_spine_access_port_selector" "selector" {
  count = local.port_selector.use_existing == true ? 1 : 0
  spine_interface_profile_dn        = var.spine_interface_profile_dn
  name = local.port_selector.name
  spine_access_port_selector_type = "range"
}

resource "aci_spine_access_port_selector" "selector" {
  count = local.port_selector.use_existing == false ? 1 : 0
  spine_interface_profile_dn        = var.spine_interface_profile_dn
  name                              = local.port_selector.name
  spine_access_port_selector_type   = local.port_selector.spine_access_port_selector_type
  annotation                        = local.port_selector.annotation
  name_alias                        = local.port_selector.name_alias

  ### Policy Group Name ###
  relation_infra_rs_sp_acc_grp = local.port_selector.policy_group.name != null ? (local.port_selector.policy_group.use_existing == true ? data.aci_spine_port_policy_group.group[0].id : var.interface_policy_group_map[local.port_selector.policy_group.name].id) : null

}

### NOTE: Uses access port block still ###
module "port_block" {
  for_each = var.port_selector.port_blocks
  source    = "./modules/port_block"

  ### VARIABLES ###
  access_port_selector_dn = local.port_selector.policy_group.use_existing == true ? data.aci_spine_access_port_selector.selector[0].id : aci_spine_access_port_selector.selector[0].id
  port_block              = each.value
}
