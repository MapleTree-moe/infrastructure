#
# Allow these to be used in other modules
#
output "kanade_ipv4_addr" {
  value = vultr_instance.kanade.main_ip
}
output "kanade_ipv6_addr" {
  value = vultr_instance.kanade.v6_main_ip
}
