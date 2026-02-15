# =============================================================================
# LOCALS - Lys Community
# Mapping des rôles et presets de permissions pour les canaux.
# =============================================================================

locals {
  role_ids = {
    everyone = var.server_id

    # Staff alliance
    conseil           = discord_role.conseil_role.id
    officier_alliance = discord_role.officier_alliance_role.id
    admin             = discord_role.admin_role.id

    # Rôles guilde (bot)
    lock_down_membre = discord_role.lock_down_membre_role.id
    lock_down_staff  = discord_role.lock_down_staff_role.id
    urssaf_membre    = discord_role.urssaf_membre_role.id
    urssaf_staff     = discord_role.urssaf_staff_role.id

    # Membres
    membre  = discord_role.membre_role.id
    incomer = discord_role.incomer_role.id
    noptt   = discord_role.noptt_role.id
    bot     = discord_role.bot_role.id
  }

  # Permissions Discord (presets réutilisables)
  perm_bits = {
    view_channel         = 1024
    send_messages        = 2048
    read_message_history = 65536
    embed_links          = 16384
    attach_files         = 32768
    add_reactions        = 64
    connect              = 1048576
    speak                = 2097152
    use_vad              = 33554432   # Use Voice Activity (sans ce droit = PTT forcé)
    use_slash_commands   = 2147483648
    manage_channels      = 16
    manage_messages      = 8192
  }

  perms = {
    none             = 0
    deny_view        = 1049600
    text_read_write  = 1115136
    voice_basic      = 36701184
    voice_with_vad   = 36701184 + 33554432  # vocal + détection vocale (pour noptt)
    public_read      = 309237713920
    staff_view       = 1049600
    forum_read_write = 274877975616
  }
}
