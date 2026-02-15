# =============================================================================
# OUTPUTS - Pour config bot / scripts (IDs stables après apply)
# =============================================================================

output "server_id" {
  description = "ID du serveur Discord (Guild ID)"
  value       = var.server_id
}

output "role_ids" {
  description = "IDs des rôles (à utiliser par le bot pour attribution)"
  value = {
    bot              = discord_role.bot_role.id
    admin            = discord_role.admin_role.id
    conseil          = discord_role.conseil_role.id
    officier_alliance = discord_role.officier_alliance_role.id
    guilde_lys       = discord_role.guilde_lys_role.id
    membre           = discord_role.membre_role.id
    incomer          = discord_role.incomer_role.id
  }
  sensitive = false
}

output "channel_ids" {
  description = "IDs des canaux principaux (optionnel pour le bot)"
  value = {
    rules     = discord_text_channel.rules_text.id
    annonces  = discord_text_channel.annonces_text.id
    chat      = discord_text_channel.chat_text.id
    staff     = discord_text_channel.staff_general_text.id
  }
  sensitive = false
}
