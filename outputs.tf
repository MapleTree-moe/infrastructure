###
### mapletree.moe - infrastructure management
### terraform root module
###
output "db_backup_webhook" {
  description = "Webhook URL"
  value       = module.discord_mapletree.db_backup_webhook_url
}
output "tokisaki_access_key_id" {
  description = "Tokisaki's Access Key ID"
  value       = module.backblaze.tokisaki_access_key_id
}
output "tokisaki_access_key_secret" {
  description = "Tokisaki's Access Key Secret"
  value       = module.backblaze.tokisaki_access_key_secret
}
