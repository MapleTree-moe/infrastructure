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
resource "b2_application_key" "tokisaki_maintenance" {
  key_name     = "tokisaki-v2-maintenance-user"
  bucket_id    = b2_bucket.tokisaki.bucket_id
  capabilities = var.read_write_caps
}

#
# buckets
#
resource "b2_bucket" "tokisaki" {
  bucket_name = "tokisaki-v2"
  bucket_type = "allPrivate"
}
