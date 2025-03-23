###
### mapletree.moe - infrastructure management
### terraform root module
###
output "db_backup_webhook" {
  description = "Webhook URL"
  value       = module.discord_mapletree.db_backup_webhook_url
}
