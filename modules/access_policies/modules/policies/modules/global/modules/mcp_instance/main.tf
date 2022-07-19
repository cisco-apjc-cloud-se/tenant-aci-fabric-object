terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

# NOTE: Only single instance of aci_mcp_instance_policy supported

resource "aci_mcp_instance_policy" "policy" {
  admin_st         = var.mcp_instance.admin_st
  annotation       = var.mcp_instance.annotation
  name_alias       = var.mcp_instance.name_alias
  description      = var.mcp_instance.description
  ctrl             = var.mcp_instance.ctrl
  init_delay_time  = var.mcp_instance.init_delay_time
  key              = var.mcp_instance.key
  loop_detect_mult = var.mcp_instance.loop_detect_mult
  loop_protect_act = var.mcp_instance.loop_protect_act
  tx_freq          = var.mcp_instance.tx_freq
  tx_freq_msec     = var.mcp_instance.tx_freq_msec
}
