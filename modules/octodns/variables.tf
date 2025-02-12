###
### mapletree.moe - infrastructure management
### octodns terraform module
###

variable "zone_domain" {
  type        = string
  description = "which zone to work on for this run"
}
variable "kanade_ipv4_addr" {
  type        = string
  description = "ipv4 address to set kanade to"
}
