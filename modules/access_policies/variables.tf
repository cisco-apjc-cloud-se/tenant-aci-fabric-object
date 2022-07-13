variable "access_policies" {
  type = object({
    domains = object({
      fc_domains = map(object({
        name        = string
        annotation  = optional(string)
        name_alias  = optional(string)
        vlan_pool   = string
        vsan_pool   = string
      }))
      l3_domains = map(object({
        name        = string
        annotation  = optional(string)
        name_alias  = optional(string)
        vlan_pool   = string
      }))
      physical_domains = map(object({
        name        = string
        annotation  = optional(string)
        name_alias  = optional(string)
        vlan_pool   = string
      }))
    })
    interfaces = object({
      leaf = object({
        policy_groups = map(object({
          leaf_access_bundles = map(object({
            name                    = string
            description             = optional(string)
            lag_t                   = optional(string) # The bundled ports group link aggregation type: port channel vs virtual port channel. Allowed values are "not-aggregated", "node" and "link". Default is "link".
            annotation              = optional(string)
            name_alias              = optional(string)
            aaep_name               = optional(string)
            link_level_policy_name  = optional(string)
            lldp_intf_policy_name   = optional(string)
            cdp_intf_policy_name    = optional(string)
            mcp_intf_policy_name    = optional(string)
            l2_intf_policy_name     = optional(string)
            fc_intf_policy_name     = optional(string)
            stp_intf_policy_name    = optional(string)
            port_sec_policy_name    = optional(string)
            pc_intf_policy_name     = optional(string)
          }))
          leaf_access_ports = map(object({
            name                    = string
            description             = optional(string)
            annotation              = optional(string)
            name_alias              = optional(string)
            aaep_name               = optional(string)
            link_level_policy_name  = optional(string)
            lldp_intf_policy_name   = optional(string)
            cdp_intf_policy_name    = optional(string)
            mcp_intf_policy_name    = optional(string)
            l2_intf_policy_name     = optional(string)
            fc_intf_policy_name     = optional(string)
            stp_intf_policy_name    = optional(string)
            port_sec_policy_name    = optional(string)
          }))
          leaf_breakout_ports = map(object({
            name        = string # (Required) Name of leaf breakout port group object.
            annotation  = optional(string) # (Optional) Annotation for leaf breakout port group object.
            brkout_map  = string # (Optional) Breakout map for leaf breakout port group object. Allowed values are "100g-2x", "100g-4x", "10g-4x", "25g-4x", "50g-8x" and "none". Default value is "none".
            name_alias  = optional(string) # (Optional) Name alias for leaf breakout port group object.
            description = optional(string) # (Optional) Description for leaf breakout port group object.
          }))
        }))
      })
      spine = object({})
    })
    policies = object({
      global = object({
        aaeps = map(object({
          description = optional(string)
          name        = string
          annotation  = optional(string)
          name_alias  = optional(string)
          domain_list = list(string)
        }))
        qos_class = object({
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
        })
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
    })
    pools = object({
      vlan_pools = map(object({
        pool_name     = string
        use_existing  = optional(bool)
        description   = optional(string)
        alloc_mode    = string # Allocation mode for object vlan_pool. Allowed values: "dynamic", "static"
        annotation    = optional(string)
        name_alias    = optional(string)
        ranges = map(object({
          description   = optional(string)
          from          = number
          to            = number
          alloc_mode    = optional(string) # Alloc mode for object VLAN Pool ranges. Allowed values: "dynamic", "static", "inherit". Default is "inherit".
          annotation    = optional(string)
          name_alias    = optional(string)
          role          = optional(string) # System role type. Allowed values: "external", "internal". Default is "external".
        }))
      }))
      vsan_pools = map(object({
        pool_name     = string
        use_existing  = optional(bool)
        description   = optional(string)
        alloc_mode    = optional(string) # Allocation mode for object vsan_pool. Allowed values: "static"
        annotation    = optional(string)
        name_alias    = optional(string)
        ranges = map(object({
          description   = optional(string)
          from          = number
          to            = number
          alloc_mode    = optional(string) # Alloc mode for object VSAN Pool ranges. Allowed values: "static", "inherit". Default is "inherit".
          annotation    = optional(string)
          name_alias    = optional(string)
          role          = optional(string) # System role type. Allowed values: "external", "internal". Default is "external".
        }))
      }))
    })
  })
}
