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
resource "octodns_a_record" "root" {
  zone = "mapletree.moe"
  name = "@"
  ttl  = 300
  # the root domain A value points to kanade
  values = [var.kanade_ipv4_addr]
}
