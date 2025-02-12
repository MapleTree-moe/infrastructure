###
### mapletree.moe - infrastructure management
### hetzner terraform module
###

output "kanade_ipv4_addr" {
  value = hcloud_primary_ip.kanade_ipv4.ip_address
}
