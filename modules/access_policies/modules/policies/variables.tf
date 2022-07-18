variable "policies" {
  type = object({
    global = object({
      aaeps = map(object({
        name                = string
        use_existing        = optional(bool)
        description         = optional(string)
        annotation          = optional(string)
        name_alias          = optional(string)
        enable_infra_vlan   = bool
        associated_domains  = map(object({
          use_existing  = optional(bool)
          name          = string
          type          = optional(string)
        }))
      }))
      qos_class = optional(object({
        name_alias            = optional(string) # "qos_instance_alias"
        description           = optional(string) # "From Terraform"
        etrap_age_timer       = optional(number) # "0"
        etrap_bw_thresh       = optional(number) # "0"
        etrap_byte_ct         = optional(number) # "0"
        etrap_st              = optional(string) # "no"
        fabric_flush_interval = optional(number) # "500"
        fabric_flush_st       = optional(string) # "no"
        annotation            = optional(string) # "orchestrator:terraform"
        ctrl                  = optional(string) # "none"
        uburst_spine_queues   = optional(number) # "10"
        uburst_tor_queues     = optional(number) # "10"
      }))
    })
    interface = object({
      cdp_policies = map(object({
        name        = string # (Required) Name of Object cdp interface policy.
        admin_st    = optional(string) # (Optional) Administrative state. Allowed values: "enabled", "disabled". Default value is "enabled".
        annotation  = optional(string) # (Optional) Annotation for object cdp interface policy.
        name_alias  = optional(string) # (Optional) Name alias for object cdp interface policy.
        description = optional(string) # (Optional) Description for object cdp interface policy.
      }))
      fc_policies = map(object({
        name          = string # (Required) Name of Object interface FC policy.
        annotation    = optional(string) # (Optional) Annotation for object interface FC policy.
        description   = optional(string) # (Optional) Description for object interface FC policy.
        automaxspeed  = optional(string) # (Optional) Auto-max-speed for object interface FC policy. Allowed values are "2G", "4G", "8G", "16G" and "32G". Default value is "32G".
        fill_pattern  = optional(string) # (Optional) Fill Pattern for native FC ports. Allowed values are "ARBFF" and "IDLE". Default is "IDLE".
        name_alias    = optional(string) # (Optional) Name alias for object Interface FC policy.
        port_mode     = optional(string) # (Optional) In which mode Ports should be used. Allowed values are "f" and "np". Default is "f".
        rx_bb_credit  = optional(number) # (Optional) Receive buffer credits for native FC ports Range:(16 - 64). Default value is "64".
        speed         = optional(string) # (Optional) CPU or port speed. All the supported values are "unknown", "auto", "4G", "8G", "16G", "32G". Default value is "auto".
        trunk_mode    = optional(string) # (Optional) Trunking on/off for native FC ports. Allowed values are "un-init", "trunk-off", "trunk-on" and "auto". Default value is "trunk-off".
      }))
      l2_policies = map(object({
        name        = string # (Required) Name of Object L2 interface policy.
        annotation  = optional(string) # (Optional) Annotation for object L2 interface policy.
        description = optional(string) # (Optional) Description for object L2 interface policy.
        name_alias  = optional(string) # (Optional) Name alias for object L2 interface policy.
        qinq        = optional(string) # (Optional) Determines if QinQ is disabled or if the port should be considered a core or edge port. Allowed values are "disabled", "edgePort", "corePort" and "doubleQtagPort". Default is "disabled".
        vepa        = optional(string) # (Optional) Determines if Virtual Ethernet Port Aggregator is disabled or enabled. Allowed values are "disabled" and "enabled". Default is "disabled".
        vlan_scope  = optional(string) # (Optional) The scope of the VLAN. Allowed values are "global" and "portlocal". Default is "global".
      }))
      link_level_policies = map(object({
        name          = string # (Required) Name of object fabric if pol.
        annotation    = optional(string) # (Optional) Annotation for object fabric if pol.
        description   = optional(string) # (Optional) Description for object fabric if pol.
        auto_neg      = optional(string) # (Optional) Policy auto negotiation for object fabric if pol. Allowed values: "on", "off". Default value is "on".
        fec_mode      = optional(string) # (Optional) Forwarding error correction for object fabric if pol. Allowed values: "inherit", "cl91-rs-fec", "cl74-fc-fec", "ieee-rs-fec", "cons16-rs-fec", "kp-fec", "disable-fec". Default value is "inherit".
        link_debounce = optional(number) # (Optional) Link debounce interval for object fabric if pol. Range of allowed values: "0" to "5000". Default value is "100".
        name_alias    = optional(string) # (Optional) Name alias for object fabric if pol.
        speed         = optional(string) # (Optional) Port speed for object fabric if pol. Allowed values: "unknown", "100M", "1G", "10G", "25G", "40G", "50G", "100G","200G", "400G", "inherit". Default value is "inherit".
      }))
      lldp_policies = map(object({
        name        = string # (Required) Name of Object LLDP Interface Policy.
        admin_rx_st = optional(string) # (Optional) Admin receive state. Allowed values are "enabled" and "disabled". Default value is "enabled".
        admin_tx_st = optional(string) # (Optional) Admin transmit state. Allowed values are "enabled" and "disabled". Default value is "enabled".
        description = optional(string) # (Optional) Description for object LLDP Interface Policy.
        annotation  = optional(string) # (Optional) Annotation for object LLDP Interface Policy.
        name_alias  = optional(string) # (Optional) Name alias for object LLDP Interface Policy.
      }))
      mcp_policies = map(object({
        name        = string # (Required) Name of Object miscabling protocol interface policy.
        admin_st    = optional(string) # (Optional) Administrative state of the object or policy. Allowed values are "enabled" and "disabled". Default is "enabled".
        description = optional(string) # (Optional) Description for object miscabling protocol interface policy.
        annotation  = optional(string) # (Optional) Annotation for object miscabling protocol interface policy.
        name_alias  = optional(string) # (Optional) Name alias for object miscabling protocol interface policy.
      }))
      pc_policies = map(object({
        name        = string # (Required) Name of Object LACP Policy.
        description = optional(string) # (Optional) Description for object LACP Policy.
        annotation  = optional(string) # (Optional) Annotation for object LACP Policy.
        ctrl        = optional(list(string)) # (Optional) List of LAG control properties. Allowed values are "symmetric-hash", "susp-individual", "graceful-conv", "load-defer" and "fast-sel-hot-stdby". default value is ["fast-sel-hot-stdby", "graceful-conv", "susp-individual"]
        max_links   = optional(number) # (Optional) Maximum number of links. Allowed value range is "1" - "16". Default is "16".
        min_links   = optional(number) # (Optional) Minimum number of links in port channel. Allowed value range is "1" - "16". Default is "1".
        mode        = optional(string) # (Optional) policy mode. Allowed values are "off", "active", "passive", "mac-pin" and "mac-pin-nicload". Default is "off".
        name_alias  = optional(string) # (Optional) Name alias for object LACP Policy.
      }))
      port_security_policies = map(object({
        name        = string # (Required) Name of Object port security policy.
        description = optional(string) # (Optional) Description for object port security policy.
        annotation  = optional(string) # (Optional) Annotation for object port security policy.
        maximum     = optional(number) # (Optional) Port Security Maximum. Allowed value range is "0" - "12000". Default is "0".
        name_alias  = optional(string) # (Optional) Name alias for object port security policy.
        timeout     = optional(number) # (Optional) Amount of time between authentication attempts. Allowed value range is "60" - "3600". Default is "60".
        violation   = optional(string) # (Optional) Port Security Violation. default value is "protect". Allowed value: "protect"
      }))
      stp_policies = map(object({
        name        = string # (Required) Name of object Spanning Tree Interface Policy.
        annotation  = optional(string) # (Optional) Annotation of object Spanning Tree Interface Policy.
        name_alias  = optional(string) # (Optional) Name alias of object Spanning Tree Interface Policy.
        description = optional(string) # (Optional) Description of object Spanning Tree Interface Policy.
        ctrl        = optional(list(string)) # (Optional) Interface controls. Allowed values are "bpdu-filter", "bpdu-guard", "unspecified". The default value is "unspecified". Unspecified value should not be added along with other allowed values. Type: List.
      }))
    })
    switch = object({
      vpc_domains = map(object({
        name        = string # (Required) Name of object VPC Domain Policy.
        annotation  = optional(string) # (Optional) Annotation of object VPC Domain Policy.
        dead_intvl  = optional(string) # (Optional) The VPC peer dead interval time of object VPC Domain Policy. Range: "5" - "600". Default value is "200".
        name_alias  = optional(string) # (Optional) Name Alias of object VPC Domain Policy.
        description = optional(string) # (Optional) Description of object VPC Domain Policy.
      }))
      vpc_protection_groups = map(object({
        name                              = string # (Required) Name of Object VPC Explicit Protection Group.
        switch1                           = number # (Required) Node Id of switch 1 to attach.
        switch2                           = number # (Required) Node Id of switch 2 to attach.
        annotation                        = optional(string) # (Optional) Annotation for object VPC Explicit Protection Group.
        vpc_domain_policy                 = optional(string) # (Optional) VPC domain policy name.
        vpc_explicit_protection_group_id  = optional(number) # (Optional) Explicit protection group ID. Integer values are allowed between 1-1000. default value is "0".
      }))
    })
  })
}

variable "domain_map" {}
