terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

resource "aci_fabric_if_pol" "link" {
  name        = "fabric_if_pol_1"
  description = "Link Level description"
  annotation  = "fabric_if_pol_tag"
  auto_neg    = "on"
  fec_mode    = "inherit"
  name_alias  = "alias_ifpol"
  link_debounce  = "100"
  speed       = "inherit"
}
