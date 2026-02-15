# =============================================================================
# CATÉGORIE: PUBLIC
# Salons accessibles à tous les membres de l'alliance.
# =============================================================================

resource "discord_category_channel" "public_cat" {
  server_id = var.server_id
  name      = "Public"

  lifecycle {
    ignore_changes = [position]
  }
}

resource "discord_channel_permission" "public_cat_everyone_perm" {
  channel_id   = discord_category_channel.public_cat.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.public_read
  deny         = local.perms.none
}

resource "discord_text_channel" "rules_text" {
  server_id                = var.server_id
  name                     = "rules"
  category                 = discord_category_channel.public_cat.id
  sync_perms_with_category = true

  lifecycle {
    ignore_changes = [position]
  }
}

resource "discord_text_channel" "annonces_text" {
  server_id                = var.server_id
  name                     = "annonces"
  category                 = discord_category_channel.public_cat.id
  sync_perms_with_category = true

  lifecycle {
    ignore_changes = [position]
  }
}

resource "discord_text_channel" "chat_text" {
  server_id                = var.server_id
  name                     = "chat"
  category                 = discord_category_channel.public_cat.id
  sync_perms_with_category = true

  lifecycle {
    ignore_changes = [position]
  }
}
