###
### mapletree.moe - infrastructure management
### discord terraform module
###

# NOTE: configured messages are at the bottom of the file

#
# terraform block
#
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    discord = {
      source  = "lucky3028/discord"
      version = "~> 2.0.0"
    }
  }
}

#
# managed server
#
resource "discord_server" "mapletree" {
  name                          = "MapleTree.moe"
  icon_url                      = var.server-icon
  default_message_notifications = 1
  verification_level            = 3
}

#
# discord roles
#
resource "discord_role" "admin" {
  server_id   = discord_server.mapletree.id
  name        = "Administrators"
  hoist       = true
  mentionable = true
  color       = data.discord_color.pink.dec
  permissions = data.discord_permission.admin.allow_bits
}
resource "discord_role" "user" {
  server_id = discord_server.mapletree.id
  name      = "Users"
  hoist     = true
  color     = data.discord_color.purple.dec
}
resource "discord_role_everyone" "everyone" {
  server_id   = discord_server.mapletree.id
  permissions = data.discord_permission.default.allow_bits
}

#
# channel categories
#
resource "discord_category_channel" "readme" {
  name      = "Read Me First!"
  server_id = discord_server.mapletree.id
  position  = 0
}
resource "discord_category_channel" "administration" {
  name      = "Administration"
  server_id = discord_server.mapletree.id
  position  = 1
}
resource "discord_category_channel" "discussion" {
  name      = "Discussion"
  server_id = discord_server.mapletree.id
  position  = 2
}
resource "discord_category_channel" "requests" {
  name      = "Requests & Issues"
  server_id = discord_server.mapletree.id
  position  = 3
}
resource "discord_category_channel" "notifications" {
  name      = "Server Notifications"
  server_id = discord_server.mapletree.id
  position  = 4
}
resource "discord_category_channel" "notes" {
  name      = "Server Notes"
  server_id = discord_server.mapletree.id
  position  = 5
}

#
# category permissions
#
resource "discord_channel_permission" "administration" {
  channel_id   = discord_category_channel.administration.id
  type         = "role"
  overwrite_id = discord_role_everyone.everyone.id
  deny         = data.discord_permission.deny.deny_bits
}

#
# text channels - group into category blocks
#

# category: readme
resource "discord_text_channel" "readme_welcome" {
  name                     = "welcome"
  server_id                = discord_server.mapletree.id
  category                 = discord_category_channel.readme.id
  sync_perms_with_category = true
  position                 = 0
}
resource "discord_text_channel" "readme_rules" {
  name                     = "rules"
  server_id                = discord_server.mapletree.id
  category                 = discord_category_channel.readme.id
  sync_perms_with_category = true
  position                 = 1
}
resource "discord_text_channel" "readme_announcements" {
  name                     = "announcements"
  server_id                = discord_server.mapletree.id
  category                 = discord_category_channel.readme.id
  sync_perms_with_category = true
  position                 = 2
}
resource "discord_text_channel" "readme_hints" {
  name                     = "hints-and-tips"
  server_id                = discord_server.mapletree.id
  category                 = discord_category_channel.readme.id
  sync_perms_with_category = true
  position                 = 3
}

# category: administration
resource "discord_text_channel" "administration_general" {
  name                     = "general"
  server_id                = discord_server.mapletree.id
  category                 = discord_category_channel.administration.id
  sync_perms_with_category = true
  position                 = 4
  topic                    = "Administrator Discussion"
}
resource "discord_text_channel" "administration_server_notice" {
  name                     = "server-notice"
  server_id                = discord_server.mapletree.id
  category                 = discord_category_channel.administration.id
  sync_perms_with_category = true
  position                 = 5
  topic                    = "Server Automation Notices"
}

# category: discussion
resource "discord_text_channel" "discussion_general" {
  name                     = "general"
  server_id                = discord_server.mapletree.id
  category                 = discord_category_channel.discussion.id
  sync_perms_with_category = true
  position                 = 6
  topic                    = "General server discussion"
}
resource "discord_text_channel" "discussion_content" {
  name                     = "content-discussion"
  server_id                = discord_server.mapletree.id
  category                 = discord_category_channel.discussion.id
  sync_perms_with_category = true
  position                 = 7
  topic                    = "Talk about movies, shows, anime, etc."
}
resource "discord_text_channel" "discussion_technical" {
  name                     = "technical-discussion"
  server_id                = discord_server.mapletree.id
  category                 = discord_category_channel.discussion.id
  sync_perms_with_category = true
  position                 = 8
  topic                    = "Discussion of Maple's Technical components and configuration."
}

# category: requests
resource "discord_text_channel" "requests_priority" {
  name                     = "priority-requests"
  server_id                = discord_server.mapletree.id
  category                 = discord_category_channel.requests.id
  sync_perms_with_category = true
  position                 = 9
  topic                    = "Please provide the name of your request and why it should be expedited. One priority request per person per week. Thanks!"
}
resource "discord_text_channel" "requests_issues" {
  name                     = "issues"
  server_id                = discord_server.mapletree.id
  category                 = discord_category_channel.requests.id
  sync_perms_with_category = true
  position                 = 10
  topic                    = "If you have any issues NOT related to media playback, post them here."
}
resource "discord_text_channel" "requests_features" {
  name                     = "feature-requests"
  server_id                = discord_server.mapletree.id
  category                 = discord_category_channel.requests.id
  sync_perms_with_category = true
  position                 = 11
  topic                    = "Features you would like to see added to Maple."
}

# category: notifications
resource "discord_text_channel" "notifications_readme" {
  name                     = "readme"
  server_id                = discord_server.mapletree.id
  category                 = discord_category_channel.notifications.id
  sync_perms_with_category = true
  position                 = 12
}
resource "discord_text_channel" "notifications_status" {
  name                     = "status"
  server_id                = discord_server.mapletree.id
  category                 = discord_category_channel.notifications.id
  sync_perms_with_category = true
  position                 = 13
}
resource "discord_text_channel" "notifications_requests" {
  name                     = "requests"
  server_id                = discord_server.mapletree.id
  category                 = discord_category_channel.notifications.id
  sync_perms_with_category = true
  position                 = 14
}
resource "discord_text_channel" "notifications_manual" {
  name                     = "manual-intervention"
  server_id                = discord_server.mapletree.id
  category                 = discord_category_channel.notifications.id
  sync_perms_with_category = true
  position                 = 15
  topic                    = "A message will be sent here when administrator intervention is required for a release."
}
resource "discord_text_channel" "notifications_automation" {
  name                     = "automation-spam"
  server_id                = discord_server.mapletree.id
  category                 = discord_category_channel.notifications.id
  sync_perms_with_category = true
  position                 = 16
  topic                    = "This channel will contain all the various outputs from Maple's automation systems. It is highly recommended you mute it."
}
resource "discord_text_channel" "notifications_health" {
  name                     = "health-errors"
  server_id                = discord_server.mapletree.id
  category                 = discord_category_channel.notifications.id
  sync_perms_with_category = true
  position                 = 17
  topic                    = "Automation and System Health Errors"
}

# category: notes
resource "discord_text_channel" "notes_perfected" {
  name                     = "perfected-releases"
  server_id                = discord_server.mapletree.id
  category                 = discord_category_channel.notes.id
  sync_perms_with_category = true
  position                 = 18
  topic                    = "Library of the servers Perfected Releases."
}
resource "discord_text_channel" "notes_build" {
  name                     = "build-notes"
  server_id                = discord_server.mapletree.id
  category                 = discord_category_channel.notes.id
  sync_perms_with_category = true
  position                 = 19
}

#
# misc
#
resource "discord_system_channel" "system" {
  server_id         = discord_server.mapletree.id
  system_channel_id = discord_text_channel.discussion_general.id
}

#
# webhooks
#
resource "discord_webhook" "db_backup_webhook" {
  channel_id = discord_text_channel.administration_server_notice.id
  name       = "Nagato - Database Backups"
  avatar_url = var.nagato-icon
}

#
# messages - static messages subject to version control
#
resource "discord_message" "welcome_message" {
  channel_id = discord_text_channel.readme_welcome.id
  embed {
    title       = "Welcome to MapleTree.moe"
    color       = data.discord_color.red.dec
    description = "Please get started by reading through the 'Read Me First!' category."
    author {
      icon_url = var.server-icon
      name     = "Maple Welcome v1.0"
    }
    footer {
      icon_url = var.nagato-icon
      text     = var.nagato-version
    }
    image {
      url = var.welcome-image
    }
  }
}
resource "discord_message" "discord_rules" {
  channel_id = discord_text_channel.readme_rules.id
  embed {
    title = "Discord Rules v2.1"
    author {
      icon_url = discord_server.mapletree.icon_url
      name     = "Updated 25/02/09"
    }
    color       = data.discord_color.red.dec
    description = "These rules pertain to the discord server itself."
    footer {
      icon_url = var.nagato-icon
      text     = var.nagato-version
    }
    fields {
      name   = "1. This server is a private server."
      value  = "Do not discuss this server in public channels or private channels of any other discord server."
      inline = false
    }
    fields {
      name   = "2. Don't be an ass."
      value  = "This server uses relatively few permissions, and everyone has access to all areas."
      inline = false
    }
    fields {
      name   = "3. This server is disposable."
      value  = "However it is archived once every 24 hours and is fully version controlled as a code representation in terraform."
      inline = false
    }
    fields {
      name   = "4. Don't complain about notification spam."
      value  = "Please mute any channels that you don't feel are relevant to you."
      inline = false
    }
    fields {
      name   = "5. Do NOT under ANY circumstances post links to anything that violates the discord ToS."
      value  = "You can feel free to discuss piracy, but do not link to any torrents, or torrent groups, within this server."
      inline = false
    }
  }
}
resource "discord_message" "access_rules" {
  channel_id = discord_text_channel.readme_rules.id
  embed {
    title = "Access Rules v2.1"
    author {
      icon_url = discord_server.mapletree.icon_url
      name     = "Updated 25/02/09"
    }
    color       = data.discord_color.red.dec
    description = "Instructions and requirements for accessing maple."
    footer {
      icon_url = var.nagato-icon
      text     = var.nagato-version
    }
    fields {
      name   = "1. New users need to DM Yuki."
      value  = "Please include the e-mail address you would like tied to your account, as well as any preferred usernames."
      inline = false
    }
    fields {
      name   = "2. Multifactor Authentication is required."
      value  = "Maple makes use of standard application based TOTP as well as Passkeys for 2FA."
      inline = false
    }
  }
}
resource "discord_message" "usage_rules" {
  channel_id = discord_text_channel.readme_rules.id
  embed {
    title = "Usage Rules v2.0"
    author {
      icon_url = discord_server.mapletree.icon_url
      name     = "Updated 25/02/09"
    }
    color       = data.discord_color.red.dec
    description = "Restrictions on using Maple."
    footer {
      icon_url = var.nagato-icon
      text     = var.nagato-version
    }
    fields {
      name   = "1. Please use clients if they are available."
      value  = "Using a client side program as opposed to a web browser is produces less load on maple, may provide a higher quality viewing experience, and may even be less laggy. Check out #hints-and-tips for more information."
      inline = false
    }
    fields {
      name   = "2. Timezones exist."
      value  = "Due to the geographic distribution of our user base, there's a chance maple may end up under heavy load when you try to use her. If it's a recurrent problem for over a week, please let an admin know."
      inline = false
    }
    fields {
      name   = "3. System Status"
      value  = "If you have any concerns about the Mapletree.moe services and their status, you can always check the [System Status](https://status.mapletree.moe) page for information."
      inline = false
    }
  }
}
resource "discord_message" "request_rules" {
  channel_id = discord_text_channel.readme_rules.id
  embed {
    title = "Request Rules v2.2"
    author {
      icon_url = discord_server.mapletree.icon_url
      name     = "Updated 25/02/09"
    }
    color       = data.discord_color.red.dec
    description = "Rules pertaining to the request automation system."
    footer {
      icon_url = var.nagato-icon
      text     = var.nagato-version
    }
    fields {
      name   = "1. Request Limits"
      value  = "Users are limited to 5 requests every 7 days in each major request category."
      inline = false
    }
    fields {
      name   = "2. Double Check Profiles."
      value  = "While the recommended profile is usually correct, sometimes the software can get confused. Please make sure to select the appropriate request profile."
      inline = false
    }
    fields {
      name   = "3. Priority Requests"
      value  = "If you need something quickly, please post in the priority requests channel."
      inline = false
    }
    fields {
      name   = "4. **Yooman's Folly**"
      value  = "If requesting an anime or series over 100 episodes, and requesting everything simultaneously, you MUST open an issue tracking thread instead of using the requests system."
      inline = false
    }
    fields {
      name   = "5. Long wait times"
      value  = "If it has been longer than 72 hours since you made your request, feel free to contact an admin."
      inline = false
    }
    fields {
      name   = "6. HunterXHunter Rule"
      value  = "Do NOT under any circumstances request an old anime and its remake if they are named exactly the same, simultaneously. Open an issue tracking thread and get help from an admin."
      inline = false
    }
    fields {
      name   = "Rule Violations"
      value  = "Repeated violations of the rules, especially Yooman's Folly and the HxH rule, can and will result in all of your requests needing to be reviewed before going into the automation queue, or in extreme circumstances a ban from the server."
      inline = false
    }
  }
}
resource "discord_message" "cloud_rules" {
  channel_id = discord_text_channel.readme_rules.id
  embed {
    title = "Cloud Services Rules v2.1"
    author {
      icon_url = discord_server.mapletree.icon_url
      name     = "Updated 25/02/09"
    }
    color       = data.discord_color.red.dec
    description = "Rules pertaining to maple's nextcloud deployment."
    footer {
      icon_url = var.nagato-icon
      text     = var.nagato-version
    }
    fields {
      name   = "1. Please use the Nextcloud client for filesync."
      value  = "It can use binary diffs when files update, so it is faster and produces less load than downloading from the webclient every time. You can also use the client to mirror data to your own computer from the public libraries."
      inline = false
    }
    fields {
      name   = "2. Encryption"
      value  = "Data on Maple is encrypted at rest, but you can also use client side encryption as well. Please refer to the Nextcloud documentation to set that up."
      inline = false
    }
    fields {
      name   = "3. File Sharing"
      value  = "You can use Files to generate public share links for your own data as well as data in the public libraries. Do NOT use this to share multi-gigabyte files."
      inline = false
    }
    fields {
      name   = "4. Drop-boxes"
      value  = "You can set up an anonymous drop box to allow people to upload things into your library without an account. Please refer to the nextcloud documentation for instructions."
      inline = false
    }
    fields {
      name   = "5. Data integrity and SLA"
      value  = "While I do everything in my power to prevent data loss, Maple is still only a single server run as a hobby project. You should not rely on her as your primary backup."
      inline = false
    }
  }
}
