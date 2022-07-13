terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_port_security_policy" "portsec" {
  description = var.port_security.description
  name        = var.port_security.name
  annotation  = var.port_security.annotation
  maximum     = var.port_security.maximum
  name_alias  = var.port_security.name_alias
  timeout     = var.port_security.timeout
  violation   = var.port_security.violation
}
