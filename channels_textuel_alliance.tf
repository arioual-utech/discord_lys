# =============================================================================
# CATÉGORIE: TEXTUEL ALLIANCE
# Salons texte partagés par les guildes de l'alliance.
# =============================================================================

resource "discord_category_channel" "textuel_alliance_cat" {
  server_id = var.server_id
  name      = "Textuel alliance"

  lifecycle {
    ignore_changes = [position]
  }
}

# Caché à @everyone et Incomer ; visible uniquement avec un rôle membre ou staff
resource "discord_channel_permission" "textuel_alliance_cat_everyone_perm" {
  channel_id   = discord_category_channel.textuel_alliance_cat.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "textuel_alliance_cat_incomer_perm" {
  channel_id   = discord_category_channel.textuel_alliance_cat.id
  type         = "role"
  overwrite_id = local.role_ids.incomer
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "textuel_alliance_cat_membre_perm" {
  channel_id   = discord_category_channel.textuel_alliance_cat.id
  type         = "role"
  overwrite_id = local.role_ids.membre
  allow        = local.perms.text_read_write
  deny         = local.perms.none
}

resource "discord_channel_permission" "textuel_alliance_cat_lock_down_membre_perm" {
  channel_id   = discord_category_channel.textuel_alliance_cat.id
  type         = "role"
  overwrite_id = local.role_ids.lock_down_membre
  allow        = local.perms.text_read_write
  deny         = local.perms.none
}

resource "discord_channel_permission" "textuel_alliance_cat_lock_down_staff_perm" {
  channel_id   = discord_category_channel.textuel_alliance_cat.id
  type         = "role"
  overwrite_id = local.role_ids.lock_down_staff
  allow        = local.perms.text_read_write
  deny         = local.perms.none
}

resource "discord_channel_permission" "textuel_alliance_cat_urssaf_membre_perm" {
  channel_id   = discord_category_channel.textuel_alliance_cat.id
  type         = "role"
  overwrite_id = local.role_ids.urssaf_membre
  allow        = local.perms.text_read_write
  deny         = local.perms.none
}

resource "discord_channel_permission" "textuel_alliance_cat_urssaf_staff_perm" {
  channel_id   = discord_category_channel.textuel_alliance_cat.id
  type         = "role"
  overwrite_id = local.role_ids.urssaf_staff
  allow        = local.perms.text_read_write
  deny         = local.perms.none
}

resource "discord_channel_permission" "textuel_alliance_cat_conseil_perm" {
  channel_id   = discord_category_channel.textuel_alliance_cat.id
  type         = "role"
  overwrite_id = local.role_ids.conseil
  allow        = local.perms.text_read_write
  deny         = local.perms.none
}

resource "discord_channel_permission" "textuel_alliance_cat_officier_alliance_perm" {
  channel_id   = discord_category_channel.textuel_alliance_cat.id
  type         = "role"
  overwrite_id = local.role_ids.officier_alliance
  allow        = local.perms.text_read_write
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Canaux
# -----------------------------------------------------------------------------

resource "discord_text_channel" "textuel_alliance_event" {
  server_id                = var.server_id
  name                     = "event"
  category                 = discord_category_channel.textuel_alliance_cat.id
  sync_perms_with_category = true

  lifecycle {
    ignore_changes = [position]
  }
}

resource "discord_text_channel" "textuel_alliance_annonce" {
  server_id                = var.server_id
  name                     = "annonce"
  category                 = discord_category_channel.textuel_alliance_cat.id
  sync_perms_with_category = true

  lifecycle {
    ignore_changes = [position]
  }
}

resource "discord_text_channel" "textuel_alliance_discussion" {
  server_id                = var.server_id
  name                     = "discussion"
  category                 = discord_category_channel.textuel_alliance_cat.id
  sync_perms_with_category = true

  lifecycle {
    ignore_changes = [position]
  }
}
