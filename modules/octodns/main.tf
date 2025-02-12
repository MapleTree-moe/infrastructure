###
### mapletree.moe - infrastructure management
### octodns terraform module
###

# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    octodns = {
      source  = "topicusonderwijs/octodns"
      version = "~> 1.1.2"
    }
  }
}

#
# DNS Records to Modify
#
# NOTE: due to a bug in the provider code any of the octodns settings results
# in out of order keys. so don't use those.
resource "octodns_a_record" "root" {
  zone = var.zone_domain
  name = "@"
  ttl  = 300
  # the root domain A value points to kanade
  values = [var.kanade_ipv4_addr]
}
