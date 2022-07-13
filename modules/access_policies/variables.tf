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
