provider "discord" {
  token = var.discord_token
}

variable "discord_token" {
  description = "Token du bot Discord (ne pas commiter en dur)"
  type        = string
  sensitive   = true
}

variable "server_id" {
  description = "ID du serveur Discord (Guild ID) - Lys Community"
  type        = string
}
