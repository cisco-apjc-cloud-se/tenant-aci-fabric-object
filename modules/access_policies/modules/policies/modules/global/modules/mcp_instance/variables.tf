variable "mcp_instance" {
  type = object({
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
  })
}
