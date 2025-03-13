###
### mapletree.moe - infrastructure management
### discord terraform module
###
output "db_backup_webhook_url" {
  value = nonsensitive(discord_webhook.db_backup_webhook.slack_url)
}
