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
  zone = var.zone_domain
  name = "@"
  ttl  = 300
  # FIXME: remove this when going back live
  octodns = {
    cloudflare = {
      auto_ttl = true
      proxied  = true
    }
  }
  # the root domain A value points to kanade
  values = [var.kanade_ipv4_addr]
}
