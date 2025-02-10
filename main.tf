# Terraform Block
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
    vultr = {
      source  = "vultr/vultr"
      version = "~> 2.23.1"
    }
  }
}

#
# Provider Block
#
provider "b2" {
  application_key    = var.b2_application_key
  application_key_id = var.b2_application_key_id
}
provider "discord" {
  token = var.discord_token
}
provider "vultr" {
  api_key     = var.vultr_api_key
  rate_limit  = 100
  retry_limit = 3
}

#
# Module Block
#
module "backblaze" {
  source = "./modules/backblaze"
}
module "discord_mapletree" {
  source = "./modules/discord-mapletree"
}
module "vultr" {
  source = "./modules/vultr"
}
