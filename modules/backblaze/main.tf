###
### mapletree.moe - infrastructure management
### backblaze b2 terraform module
###

#
# terraform block
#
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    b2 = {
      source  = "backblaze/b2"
      version = "~> 0.10.0"
      configuration_aliases = [
        b2.eu,
        b2.us
      ]
    }
  }
}

#
# application keys
#
resource "b2_application_key" "kanade_litestream" {
  provider     = b2.us
  key_name     = "kanade-litestream"
  bucket_id    = b2_bucket.kanade_state.bucket_id
  capabilities = var.read_write_caps
}
resource "b2_application_key" "kanade_db_replication" {
  provider     = b2.us
  key_name     = "kanade-database-replication"
  bucket_id    = b2_bucket.kanade_databases.bucket_id
  capabilities = var.read_write_caps
}
resource "b2_application_key" "database_backup_key" {
  provider     = b2.eu
  key_name     = "mapletree-moe-database-backup-key"
  bucket_id    = b2_bucket.database_backup_bucket.bucket_id
  capabilities = var.read_write_caps
}
resource "b2_application_key" "tokisaki_access_key" {
  provider     = b2.eu
  key_name     = "mapletree-moe-tokisaki-access-key"
  bucket_id    = b2_bucket.tokisaki_data.bucket_id
  capabilities = var.read_write_caps
}

#
# buckets
#
resource "b2_bucket" "kanade_databases" {
  provider    = b2.us
  bucket_name = "kanade-databases"
  bucket_type = "allPrivate"
  default_server_side_encryption {
    algorithm = "AES256"
    mode      = "SSE-B2"
  }
}
resource "b2_bucket" "kanade_state" {
  provider    = b2.us
  bucket_name = "kanade-state"
  bucket_type = "allPrivate"
  default_server_side_encryption {
    algorithm = "AES256"
    mode      = "SSE-B2"
  }
}
resource "b2_bucket" "zyradyl_moe_kuroneko" {
  provider    = b2.us
  bucket_name = "zyradyl-moe-kuroneko"
  bucket_type = "allPublic"
}
resource "b2_bucket" "zyradyl_moe_miyuki" {
  provider    = b2.us
  bucket_name = "zyradyl-moe-miyuki"
  bucket_type = "allPublic"
}

resource "b2_bucket" "terraform_state" {
  provider    = b2.eu
  bucket_name = "mapletree-moe-terraform-state"
  bucket_type = "allPrivate"
  default_server_side_encryption {
    algorithm = "AES256"
    mode      = "SSE-B2"
  }
}

resource "b2_bucket" "tokisaki_data" {
  provider    = b2.eu
  bucket_name = "tokisaki-v3-repo"
  bucket_type = "allPrivate"
}

resource "b2_bucket" "database_backup_bucket" {
  provider    = b2.eu
  bucket_name = "mapletree-moe-database-repo"
  bucket_type = "allPrivate"
  default_server_side_encryption {
    algorithm = "AES256"
    mode      = "SSE-B2"
  }
}

resource "b2_bucket" "general_storage" {
  provider    = b2.eu
  bucket_name = "mapletree-moe-general-storage"
  bucket_type = "allPublic"
}
