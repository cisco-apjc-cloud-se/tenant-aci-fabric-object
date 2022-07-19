terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

# NOTE: Only single instance of aci_error_disable_recovery supported

locals {
  error_disable_recovery = defaults(var.error_disable_recovery, {
    event-bpduguard     = "no"
    event-ep-move       = "no"
    event-mcp-loop      = "no"
  })
}

resource "aci_error_disable_recovery" "policy" {
  annotation          = local.error_disable_recovery.annotation
  err_dis_recov_intvl = local.error_disable_recovery.err_dis_recov_intvl
  name_alias          = local.error_disable_recovery.name_alias
  description         = local.error_disable_recovery.description
  edr_event {
    event             = "event-bpduguard"
    recover           = local.error_disable_recovery.event-bpduguard
    name              = "BPDU Guard"
  }
  edr_event {
    event             = "event-ep-move"
    recover           = local.error_disable_recovery.event-ep-move
    name              = "Frequent EP move"
  }
  edr_event {
    event             = "event-mcp-loop"
    recover           = local.error_disable_recovery.event-mcp-loop
    name              = "Loop indication by MCP"
  }

}
