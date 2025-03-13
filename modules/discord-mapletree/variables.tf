###
### mapletree.moe - infrastructure management
### discord terraform module
###

#
# reused strings
#
# TODO: bring these files into the repository
variable "nagato-icon" {
  type        = string
  description = "Nagato's current Icon URL"
  default     = "https://f001.backblazeb2.com/file/zyradyl-moe-miyuki/mapletree-moe-nagato-icon.png"
}
# TODO: rewrite the footer as a variable
variable "nagato-version" {
  type        = string
  description = "Nagato's current version"
  default     = "nagato-senpai infra v0.1"
}
variable "server-icon" {
  type        = string
  description = "Discord Server Icon"
  default     = "https://f001.backblazeb2.com/file/zyradyl-moe-miyuki/mapletree-moe-icon.png"
}
variable "welcome-image" {
  type        = string
  description = "Image for the welcome channel embed"
  default     = "https://f001.backblazeb2.com/file/zyradyl-moe-miyuki/mapletree-moe-welcome.png"
}

#
# icons
#
data "discord_local_image" "server_icon" {
  file = "icons/server.png"
}
data "discord_local_image" "bot_icon" {
  file = "icons/bot.png"
}

#
# colors
#
data "discord_color" "pink" {
  rgb = "rgb(233, 30, 99)"
}
data "discord_color" "purple" {
  rgb = "rgb(155, 89, 182)"
}
data "discord_color" "red" {
  rgb = "rgb(186, 95, 102)"
}

#
# permissions
#
data "discord_permission" "admin" {
  administrator = "allow"
}
data "discord_permission" "default" {
  add_reactions         = "allow"
  attach_files          = "allow"
  change_nickname       = "allow"
  connect               = "allow"
  create_public_threads = "allow"
  embed_links           = "allow"
  read_message_history  = "allow"
  send_messages         = "allow"
  send_thread_messages  = "allow"
  speak                 = "allow"
  stream                = "allow"
  use_external_emojis   = "allow"
  use_external_stickers = "allow"
  use_vad               = "allow"
  view_channel          = "allow"
}
data "discord_permission" "deny" {
  add_reactions         = "deny"
  attach_files          = "deny"
  change_nickname       = "deny"
  connect               = "deny"
  create_public_threads = "deny"
  embed_links           = "deny"
  read_message_history  = "deny"
  send_messages         = "deny"
  send_thread_messages  = "deny"
  speak                 = "deny"
  stream                = "deny"
  use_external_emojis   = "deny"
  use_external_stickers = "deny"
  use_vad               = "deny"
  view_channel          = "deny"
}
