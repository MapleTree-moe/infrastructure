###
### mapletree.moe - infrastructure management
### terraform root module
###

#
# general
#
variable "domain" {
  type        = string
  description = "The DNS registered domain that terraform is acting on"
  default     = "mapletree.moe"
}

#
# backblaze
#
variable "b2_us_application_key" {
  type        = string
  description = "Application key to access B2 Cloud Storage"
  sensitive   = true
}
variable "b2_us_application_key_id" {
  type        = string
  description = "Key ID matching application key to access B2 Cloud Storage"
  sensitive   = true
}
variable "b2_eu_application_key" {
  type        = string
  description = "Application key to access B2 Cloud Storage"
  sensitive   = true
}
variable "b2_eu_application_key_id" {
  type        = string
  description = "Key ID matching application key to access B2 Cloud Storage"
  sensitive   = true
}

#
# octodns
#
variable "github_organization" {
  type        = string
  description = "which github organization the repository is under"
  default     = "MapleTree-moe"
}
variable "github_repo" {
  type        = string
  description = "which repository octodns lives in"
  default     = "dns"
}
variable "github_branch" {
  type        = string
  description = "which branch to push DNS updates to"
  default     = "main" # FIXME: this needs something with automation in order
  # to protect main branch from pushes.
}

#
# credentials
#
variable "discord_token" {
  type        = string
  description = "Discord Bot Token for performing discord actions"
  sensitive   = true
}
variable "github_token" {
  type        = string
  description = "Github Token for acting on a github repository"
  sensitive   = true
}
variable "hcloud_token" {
  type        = string
  description = "Hetzner Cloud Access Token"
  sensitive   = true
}
variable "vultr_api_key" {
  type        = string
  description = "API key to access Vultr resources"
  sensitive   = true
}
