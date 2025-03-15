#
# Terraform Block
#
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "~> 2.25.0"
    }
  }
}

#
# SSH Keys
#
resource "vultr_ssh_key" "yuki_murasame" {
  name    = "yuki-murasame"
  ssh_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEYfs1EndYHRh5WcW+jkuD7IKSvZZHM+OTqDX0RuYlY"
}

#
# Firewall Groups
#
resource "vultr_firewall_group" "kanade" {
  description = "kanade.mapletree.moe"
}

#
# Firewall Rules
#
resource "vultr_firewall_rule" "ipv4_http" {
  firewall_group_id = vultr_firewall_group.kanade.id
  protocol          = "tcp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
  port              = 80
}
resource "vultr_firewall_rule" "ipv4_https" {
  firewall_group_id = vultr_firewall_group.kanade.id
  protocol          = "tcp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
  port              = 443
}
resource "vultr_firewall_rule" "ipv4_http3" {
  firewall_group_id = vultr_firewall_group.kanade.id
  protocol          = "udp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
  port              = 443
}
resource "vultr_firewall_rule" "ipv4_ssh" {
  firewall_group_id = vultr_firewall_group.kanade.id
  protocol          = "tcp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
  port              = 2222
}
resource "vultr_firewall_rule" "ipv6_http" {
  firewall_group_id = vultr_firewall_group.kanade.id
  protocol          = "tcp"
  ip_type           = "v6"
  subnet            = "::"
  subnet_size       = 0
  port              = 80
}
resource "vultr_firewall_rule" "ipv6_https" {
  firewall_group_id = vultr_firewall_group.kanade.id
  protocol          = "tcp"
  ip_type           = "v6"
  subnet            = "::"
  subnet_size       = 0
  port              = 443
}
resource "vultr_firewall_rule" "ipv6_http3" {
  firewall_group_id = vultr_firewall_group.kanade.id
  protocol          = "udp"
  ip_type           = "v6"
  subnet            = "::"
  subnet_size       = 0
  port              = 443
}
resource "vultr_firewall_rule" "ipv6_ssh" {
  firewall_group_id = vultr_firewall_group.kanade.id
  protocol          = "tcp"
  ip_type           = "v6"
  subnet            = "::"
  subnet_size       = 0
  port              = 2222
}

#
# Compute Instances
#
resource "vultr_instance" "kanade" {
  plan              = "vhp-1c-2gb-amd"
  region            = "ewr"
  os_id             = "2076"
  hostname          = "kanade.mapletree.moe"
  label             = "kanade.mapletree.moe"
  enable_ipv6       = true
  ddos_protection   = false
  firewall_group_id = vultr_firewall_group.kanade.id
}
