###
### mapletree.moe - infrastructure management
### hetzner terraform module
###

output "kanade_ipv4_addr" {
  description = "Kanade's ipv4 address"
  value       = hcloud_primary_ip.kanade_ipv4.ip_address
}
output "tokisaki_ipv4_addr" {
  description = "Tokisaki's ipv4 address"
  value       = hcloud_primary_ip.kanade_ipv4.ip_address
}
