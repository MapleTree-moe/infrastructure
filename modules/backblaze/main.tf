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
    }
  }
}

#
# application keys
#
resource "b2_application_key" "kanade_litestream" {
  key_name     = "kanade-litestream"
  bucket_id    = b2_bucket.kanade_state.bucket_id
  capabilities = var.read_write_caps
}
resource "b2_application_key" "kanade_db_replication" {
  key_name     = "kanade-database-replication"
  bucket_id    = b2_bucket.kanade_databases.bucket_id
  capabilities = var.read_write_caps
}

#
# buckets
#
resource "b2_bucket" "kanade_databases" {
  bucket_name = "kanade-databases"
  bucket_type = "allPrivate"
  default_server_side_encryption {
    algorithm = "AES256"
    mode      = "SSE-B2"
  }
}
resource "b2_bucket" "kanade_state" {
  bucket_name = "kanade-state"
  bucket_type = "allPrivate"
  default_server_side_encryption {
    algorithm = "AES256"
    mode      = "SSE-B2"
  }
}
resource "b2_bucket" "zyradyl_moe_kuroneko" {
  bucket_name = "zyradyl-moe-kuroneko"
  bucket_type = "allPublic"
}
resource "b2_bucket" "zyradyl_moe_miyuki" {
  bucket_name = "zyradyl-moe-miyuki"
  bucket_type = "allPublic"
}
