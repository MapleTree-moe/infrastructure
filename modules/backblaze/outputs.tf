###
### mapletree.moe - infrastructure management
### backblaze b2 terraform module
###
output "tokisaki_access_key_id" {
  value = nonsensitive(b2_application_key.tokisaki_access_key.application_key_id)
}
output "tokisaki_access_key_secret" {
  value = nonsensitive(b2_application_key.tokisaki_access_key.application_key)
}
