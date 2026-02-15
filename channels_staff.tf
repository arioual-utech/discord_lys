# =============================================================================
# CATÉGORIE: STAFF ALLIANCE
# Cachée à tous (aucun rôle n’a accès pour l’instant).
# =============================================================================

resource "discord_category_channel" "staff_cat" {
  server_id = var.server_id
  name      = "Staff Alliance"

  lifecycle {
    ignore_changes = [position]
  }
}

resource "discord_channel_permission" "staff_cat_everyone_perm" {
  channel_id   = discord_category_channel.staff_cat.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_text_channel" "staff_general_text" {
  server_id                = var.server_id
  name                     = "staff-général"
  category                 = discord_category_channel.staff_cat.id
  sync_perms_with_category = true

  lifecycle {
    ignore_changes = [position]
  }
}
