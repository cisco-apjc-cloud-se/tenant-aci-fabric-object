terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

# NOTE: Only single instance of aci_qos_instance_policy supported

resource "aci_qos_instance_policy" "qos" {
  name_alias            = var.qos_class.name_alias
  description           = var.qos_class.description
  etrap_age_timer       = var.qos_class.etrap_age_timer
  etrap_bw_thresh       = var.qos_class.etrap_bw_thresh
  etrap_byte_ct         = var.qos_class.etrap_byte_ct
  etrap_st              = var.qos_class.etrap_st
  fabric_flush_interval = var.qos_class.fabric_flush_interval
  fabric_flush_st       = var.qos_class.fabric_flush_st
  annotation            = var.qos_class.annotation
  ctrl                  = var.qos_class.ctrl
  uburst_spine_queues   = var.qos_class.uburst_spine_queues
  uburst_tor_queues     = var.qos_class.uburst_tor_queues
}
