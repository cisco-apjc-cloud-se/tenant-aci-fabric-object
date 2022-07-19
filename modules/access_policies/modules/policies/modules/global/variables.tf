variable "global" {
  type = object({
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
    error_disable_recovery = optional(object({
      annotation          = optional(string)
      err_dis_recov_intvl = optional(number)
      name_alias          = optional(string)
      description         = optional(string)
      event-bpduguard     = optional(string)
      event-ep-move       = optional(string)
      event-mcp-loop      = optional(string)
    }))
    mcp_instance = optional(object({
      annotation        = optional(string) # (Optional) Annotation of object MCP Instance Policy.
      admin_st          = optional(string) # (Optional) Admin State. The administrative state of the object or policy. Allowed values are "disabled", "enabled". Type: String.
      description       = optional(string) # (Optional) Description for object MCP Instance Policy. Type: String.
      name_alias        = optional(string) # (Optional) Name Alias for object MCP Instance Policy. Type: String.
      ctrl              = optional(list(string)) # (Optional) Controls. The control state. Allowed values are "pdu-per-vlan", "stateful-ha". Type: List.
      init_delay_time   = optional(number) # (Optional) Init Delay Time. Allowed range is "0"-"1800". Type: String.
      key               = string # (Required) Secret Key. The key or password used to uniquely identify this configuration object.
      loop_detect_mult  = optional(number) # (Optional) Loop Detection Multiplier. Allowed range is "1"-"255". Type: String.
      loop_protect_act  = optional(string) # (Optional) Loop Protection Action. Allowed values are "port-disable","none". Type: String.
      tx_freq           = optional(number) # (Optional) Transmission Frequency. Sets the transmission frequency of the instance advertisements. Allowed range is "0"-"300". Type: String.(Note: For value less than "2", loop_protect_act attribute needs to be "port-disable", Accepted Range of tx_freq is 100ms to 300s so total value of tx_freq & tx_freq_msec should in Accepted range.)
      tx_freq_msec      = optional(number) # (Optional) Transmission Frequency. Sets the transmission frequency of mcp advertisements in milliseconds Allowed range is "0"-"999". Type: String.(Note: For value "0" of tx_freq, range of tx_freq_msec is "100"-"999".)
    }))
  })
}

variable "domain_map" {}
