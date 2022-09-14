output "network" {
  value       = google_compute_network.network
  description = "The VPC resource being created"
}

output "network_name" {
  value       = google_compute_network.network.name
  description = "The name of the VPC being created"
}

output "network_self_link" {
  value       = google_compute_network.network.self_link
  description = "The URI of the VPC being created"
}

output "project_id" {
  value       = google_compute_network.network.project
  description = "VPC project id"
}

output "router_name" {
  value       = google_compute_router.router.name
  description = "The name of the Cloud Router being created"
}

output "external_ip_address_name" {
  value       = google_compute_address.address.name
  description = "The name of the IP External being created"
}

output "ip_self_link" {
  value       = google_compute_address.address.*.self_link
  description = "The External IP Address being created"
}

output "cloud_nat" {
  value       = google_compute_router_nat.nat.name
  description = "The name of the Cloud NAT being created"
}