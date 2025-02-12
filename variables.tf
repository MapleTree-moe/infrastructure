###
### mapletree.moe - infrastructure management
### terraform root module
###

#
# credentials
#
variable "b2_application_key" {
  type        = string
  description = "Application key to access B2 Cloud Storage"
  sensitive   = true
}
variable "b2_application_key_id" {
  type        = string
  description = "Key ID matching application key to access B2 Cloud Storage"
  sensitive   = true
}
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
