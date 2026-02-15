# =============================================================================
# CATÉGORIE: SALON VOCAUX
# Massup : droit "Use Voice Activity" (33554432) refusé pour membres/staff,
# accordé uniquement au rôle noptt → PTT forcé pour les autres.
# =============================================================================

resource "discord_category_channel" "salon_vocaux_cat" {
  server_id = var.server_id
  name      = "Salon vocaux"

  lifecycle {
    ignore_changes = [position]
  }
}

# Caché à @everyone et Incomer ; visible uniquement avec un rôle membre ou staff
resource "discord_channel_permission" "salon_vocaux_cat_everyone_perm" {
  channel_id   = discord_category_channel.salon_vocaux_cat.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "salon_vocaux_cat_incomer_perm" {
  channel_id   = discord_category_channel.salon_vocaux_cat.id
  type         = "role"
  overwrite_id = local.role_ids.incomer
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "salon_vocaux_cat_membre_perm" {
  channel_id   = discord_category_channel.salon_vocaux_cat.id
  type         = "role"
  overwrite_id = local.role_ids.membre
  allow        = local.perms.voice_basic
  deny         = local.perms.none
}

resource "discord_channel_permission" "salon_vocaux_cat_lock_down_membre_perm" {
  channel_id   = discord_category_channel.salon_vocaux_cat.id
  type         = "role"
  overwrite_id = local.role_ids.lock_down_membre
  allow        = local.perms.voice_basic
  deny         = local.perms.none
}

resource "discord_channel_permission" "salon_vocaux_cat_lock_down_staff_perm" {
  channel_id   = discord_category_channel.salon_vocaux_cat.id
  type         = "role"
  overwrite_id = local.role_ids.lock_down_staff
  allow        = local.perms.voice_basic
  deny         = local.perms.none
}

resource "discord_channel_permission" "salon_vocaux_cat_urssaf_membre_perm" {
  channel_id   = discord_category_channel.salon_vocaux_cat.id
  type         = "role"
  overwrite_id = local.role_ids.urssaf_membre
  allow        = local.perms.voice_basic
  deny         = local.perms.none
}

resource "discord_channel_permission" "salon_vocaux_cat_urssaf_staff_perm" {
  channel_id   = discord_category_channel.salon_vocaux_cat.id
  type         = "role"
  overwrite_id = local.role_ids.urssaf_staff
  allow        = local.perms.voice_basic
  deny         = local.perms.none
}

resource "discord_channel_permission" "salon_vocaux_cat_conseil_perm" {
  channel_id   = discord_category_channel.salon_vocaux_cat.id
  type         = "role"
  overwrite_id = local.role_ids.conseil
  allow        = local.perms.voice_basic
  deny         = local.perms.none
}

resource "discord_channel_permission" "salon_vocaux_cat_officier_alliance_perm" {
  channel_id   = discord_category_channel.salon_vocaux_cat.id
  type         = "role"
  overwrite_id = local.role_ids.officier_alliance
  allow        = local.perms.voice_basic
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: Massup — PTT forcé (deny Use Voice Activity) sauf pour noptt
# -----------------------------------------------------------------------------

resource "discord_voice_channel" "massup_voice" {
  server_id                 = var.server_id
  name                      = "Massup"
  category                  = discord_category_channel.salon_vocaux_cat.id
  sync_perms_with_category  = false

  lifecycle {
    ignore_changes = [position]
  }
}

# @everyone : pas d'accès au canal
resource "discord_channel_permission" "massup_voice_everyone_perm" {
  channel_id   = discord_voice_channel.massup_voice.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

# Membres et staff : vocal sans "Use Voice Activity" (donc PTT uniquement)
# On n'accorde pas use_vad → par défaut refusé ; seul noptt l'obtient ci-dessous.
resource "discord_channel_permission" "massup_voice_membre_perm" {
  channel_id   = discord_voice_channel.massup_voice.id
  type         = "role"
  overwrite_id = local.role_ids.membre
  allow        = local.perms.voice_basic
  deny         = local.perms.none
}

resource "discord_channel_permission" "massup_voice_lock_down_membre_perm" {
  channel_id   = discord_voice_channel.massup_voice.id
  type         = "role"
  overwrite_id = local.role_ids.lock_down_membre
  allow        = local.perms.voice_basic
  deny         = local.perms.none
}

resource "discord_channel_permission" "massup_voice_lock_down_staff_perm" {
  channel_id   = discord_voice_channel.massup_voice.id
  type         = "role"
  overwrite_id = local.role_ids.lock_down_staff
  allow        = local.perms.voice_basic
  deny         = local.perms.none
}

resource "discord_channel_permission" "massup_voice_urssaf_membre_perm" {
  channel_id   = discord_voice_channel.massup_voice.id
  type         = "role"
  overwrite_id = local.role_ids.urssaf_membre
  allow        = local.perms.voice_basic
  deny         = local.perms.none
}

resource "discord_channel_permission" "massup_voice_urssaf_staff_perm" {
  channel_id   = discord_voice_channel.massup_voice.id
  type         = "role"
  overwrite_id = local.role_ids.urssaf_staff
  allow        = local.perms.voice_basic
  deny         = local.perms.none
}

resource "discord_channel_permission" "massup_voice_conseil_perm" {
  channel_id   = discord_voice_channel.massup_voice.id
  type         = "role"
  overwrite_id = local.role_ids.conseil
  allow        = local.perms.voice_basic
  deny         = local.perms.none
}

resource "discord_channel_permission" "massup_voice_officier_alliance_perm" {
  channel_id   = discord_voice_channel.massup_voice.id
  type         = "role"
  overwrite_id = local.role_ids.officier_alliance
  allow        = local.perms.voice_basic
  deny         = local.perms.none
}

# noptt : vocal + "Use Voice Activity" (33554432) → détection vocale autorisée, pas de PTT forcé
resource "discord_channel_permission" "massup_voice_noptt_perm" {
  channel_id   = discord_voice_channel.massup_voice.id
  type         = "role"
  overwrite_id = local.role_ids.noptt
  allow        = local.perms.voice_with_vad
  deny         = local.perms.none
}
