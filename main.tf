###
### mapletree.moe - infrastructure management
### terraform root module
###

#
# terraform block
#
terraform {
  cloud {
    organization = "mapletree-moe"
    workspaces {
      name = "production"
    }
  }
  required_version = ">= 1.0.0"
  required_providers {
    b2 = {
      source  = "backblaze/b2"
      version = "~> 0.10.0"
    }
    discord = {
      source  = "lucky3028/discord"
      version = "~> 2.0.0"
    }
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.49"
    }
    octodns = {
      source  = "topicusonderwijs/octodns"
      version = "~> 1.1.2"
    }
    vultr = {
      source  = "vultr/vultr"
      version = "~> 2.25.0"
    }
  }
}

#
# provider configuration
#
provider "b2" {
  alias              = "us"
  application_key    = var.b2_us_application_key
  application_key_id = var.b2_us_application_key_id
}
provider "b2" {
  alias              = "eu"
  application_key    = var.b2_eu_application_key
  application_key_id = var.b2_eu_application_key_id
}
provider "discord" {
  token = var.discord_token
}
provider "hcloud" {
  token = var.hcloud_token
}
provider "octodns" {
  github_access_token = var.github_token
  github_org          = var.github_organization
  github_repo         = var.github_repo
  branch              = var.github_branch
  scope {
    name = "default"
    path = "zones"
  }
}
provider "vultr" {
  api_key     = var.vultr_api_key
  rate_limit  = 100
  retry_limit = 3
}

#
# modules
# when possible try to keep things in modules to keep root module clean
#
module "backblaze" {
  source = "./modules/backblaze"
  providers = {
    b2.eu = b2.eu
    b2.us = b2.us
  }
}
module "discord_mapletree" {
  source = "./modules/discord-mapletree"
}
module "hetzner" {
  source = "./modules/hetzner"
}
module "octodns" {
  source = "./modules/octodns"
  # we need to create the servers and have their ip addresses before we can
  # use them in octodns
  depends_on       = [module.hetzner]
  kanade_ipv4_addr = module.hetzner.kanade_ipv4_addr
  zone_domain      = var.domain
}
module "vultr" {
  source = "./modules/vultr"
}
