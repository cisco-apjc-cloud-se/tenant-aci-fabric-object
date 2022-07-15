variable "pod" {
  type = object({
    pod_id        = number
    leaf_switches = map(object({
      node_id             = number
      interface_blacklist = optional(list(string))
    }))
  })
}
