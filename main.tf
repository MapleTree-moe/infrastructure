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
  }
}

provider "b2" {
  application_key    = var.b2_application_key
  application_key_id = var.b2_application_key_id
}
provider "discord" {
  token = var.discord_token
}

module "backblaze" {
  source = "./modules/backblaze"
}
module "discord_mapletree" {
  source = "./modules/discord-mapletree"
}

moved {
  from = b2_bucket.kanade_databases
  to   = module.backblaze.b2_bucket.kanade_databases
}
moved {
  from = b2_bucket.kanade_state
  to   = module.backblaze.b2_bucket.kanade_state
}
moved {
  from = b2_bucket.zyradyl_moe_kuroneko
  to   = module.backblaze.b2_bucket.zyradyl_moe_kuroneko
}
moved {
  from = b2_bucket.zyradyl_moe_miyuki
  to   = module.backblaze.b2_bucket.zyradyl_moe_miyuki
}
