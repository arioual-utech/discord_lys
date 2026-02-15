provider "discord" {
  # Utilise la variable Terraform si définie, sinon le provider lit DISCORD_TOKEN (env)
  token = var.discord_token != "" ? var.discord_token : null
}

variable "discord_token" {
  description = "Token du bot Discord (ou définir la variable d'environnement DISCORD_TOKEN)"
  type        = string
  sensitive   = true
  default     = ""
}

variable "server_id" {
  description = "ID du serveur Discord (Guild ID) - Lys Community"
  type        = string
}
