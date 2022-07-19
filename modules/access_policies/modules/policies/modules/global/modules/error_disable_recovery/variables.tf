variable "error_disable_recovery" {
  type = object({
    annotation          = optional(string)
    err_dis_recov_intvl = optional(number)
    name_alias          = optional(string)
    description         = optional(string)
    event-bpduguard     = optional(string)
    event-ep-move       = optional(string)
    event-mcp-loop      = optional(string)
  })
}
