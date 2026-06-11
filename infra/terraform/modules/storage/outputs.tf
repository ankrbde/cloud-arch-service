output "network_name" {
  description = "Shared Docker network name"
  value       = docker_network.cloud_arch_net.name
}

output "network_id" {
  description = "Shared Docker network ID"
  value       = docker_network.cloud_arch_net.id
}