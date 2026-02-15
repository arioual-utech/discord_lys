# =============================================================================
# CATÉGORIE: INFORMATION
# Forum et infos partagées (builds, etc.)
# =============================================================================

resource "discord_category_channel" "information_cat" {
  server_id = var.server_id
  name      = "Information"

  lifecycle {
    ignore_changes = [position]
  }
}

# Caché à @everyone ; visible uniquement avec un rôle membre ou staff de guilde
resource "discord_channel_permission" "information_cat_everyone_perm" {
  channel_id   = discord_category_channel.information_cat.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "information_cat_lock_down_membre_perm" {
  channel_id   = discord_category_channel.information_cat.id
  type         = "role"
  overwrite_id = local.role_ids.lock_down_membre
  allow        = local.perms.forum_read_write
  deny         = local.perms.none
}

resource "discord_channel_permission" "information_cat_lock_down_staff_perm" {
  channel_id   = discord_category_channel.information_cat.id
  type         = "role"
  overwrite_id = local.role_ids.lock_down_staff
  allow        = local.perms.forum_read_write
  deny         = local.perms.none
}

resource "discord_channel_permission" "information_cat_urssaf_membre_perm" {
  channel_id   = discord_category_channel.information_cat.id
  type         = "role"
  overwrite_id = local.role_ids.urssaf_membre
  allow        = local.perms.forum_read_write
  deny         = local.perms.none
}

resource "discord_channel_permission" "information_cat_urssaf_staff_perm" {
  channel_id   = discord_category_channel.information_cat.id
  type         = "role"
  overwrite_id = local.role_ids.urssaf_staff
  allow        = local.perms.forum_read_write
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Forum: build
# -----------------------------------------------------------------------------

resource "discord_forum_channel" "build_forum" {
  server_id                = var.server_id
  name                     = "build"
  category                 = discord_category_channel.information_cat.id
  sync_perms_with_category = true

  lifecycle {
    ignore_changes = [position]
  }
}
