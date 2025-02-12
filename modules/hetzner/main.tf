###
### mapletree.moe - infrastructure management
### hetzner terraform module
###

#
# terraform block
#
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.49"
    }
  }
}

#
# primary IPs
#
resource "hcloud_primary_ip" "kanade_ipv4" {
  name          = "kanade-mapletree-moe-ipv4"
  datacenter    = var.hetzner_datacenter
  type          = "ipv4"
  assignee_type = "server"
  # NOTE: setting this to true will break state on server destruction
  auto_delete = false
}

#
# firewalls
#
resource "hcloud_firewall" "default_firewall" {
  name = "mapletree-moe-default-firewall"
  rule {
    direction = "in"
    protocol  = "icmp"
    source_ips = [
      "0.0.0.0/0"
    ]
  }
  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "22"
    source_ips = [
      "0.0.0.0/0"
    ]
  }
  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "80"
    source_ips = [
      "0.0.0.0/0"
    ]
  }
  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "443"
    source_ips = [
      "0.0.0.0/0"
    ]
  }
  rule {
    # this is needed for HTTP/3
    direction = "in"
    protocol  = "udp"
    port      = "443"
    source_ips = [
      "0.0.0.0/0"
    ]
  }
}

#
# servers
#
# resource "hcloud_server" "kanade" {
#   name        = "kanade.mapletree.moe"
#   image       = "alma-9"
#   server_type = "cpx11"
#   datacenter  = var.hetzner_datacenter
#   firewall_ids = [
#     hcloud_firewall.default_firewall.id
#   ]
#   user_data = file("${path.module}/cloud-init/kanade.yaml")
#   public_net {
#     ipv4_enabled = true
#     ipv4         = hcloud_primary_ip.kanade_ipv4.id
#     ipv6_enabled = false
#   }
# }
