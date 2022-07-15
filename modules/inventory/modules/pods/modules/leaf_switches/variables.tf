variable "leaf" {
  type = object({
    node_id             = number
    interface_blacklist = optional(list(string))
  })
}

variable "pod_id" {
  type = number
}
