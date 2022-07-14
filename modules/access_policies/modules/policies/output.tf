output "interface_policy_map" {
  value = module.interface.policy_map
}

output "switch_policy_map" {
  value = module.switch.policy_map
}

output "aaep_map" {
  value = module.global.aaep_map
}
