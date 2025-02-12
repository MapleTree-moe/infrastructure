###
### mapletree.moe - infrastructure management
### hetzner terraform module
###

variable "hetzner_datacenter" {
  type        = string
  description = "Datacenter to deploy Hetzner resources to"
  default     = "nbg1-dc3"
}
