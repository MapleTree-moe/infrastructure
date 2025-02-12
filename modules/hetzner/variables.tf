###
### mapletree.moe - infrastructure management
### hetzner terraform module
###

variable "hetzner_datacenter" {
  type        = string
  description = "Datacenter to deploy Hetzner resources to"
  default     = "nbg1-dc3"
}

# TODO: one day this would be cool to do
# variable "hostnames" {
#   type = list(string)
#   description = "list of hostnames to create on hetzner"
# }
