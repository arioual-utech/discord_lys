# =============================================================================
# RÔLES DISCORD - Lys Community (alliance inter-guilde)
# Les rôles "guilde" sont créés ici ; un bot les attribue aux membres.
# =============================================================================

# --- Technique ---
resource "discord_role" "bot_role" {
  server_id   = var.server_id
  name        = "bot"
  permissions = 0
  color       = 3066993
  hoist       = true
  mentionable = false
}

resource "discord_role" "admin_role" {
  server_id   = var.server_id
  name        = "admin"
  permissions = 8
  color       = 0
  hoist       = false
  mentionable = false
}

# --- Rôles guilde (attribution par bot) ---
# Lock Down
resource "discord_role" "lock_down_membre_role" {
  server_id   = var.server_id
  name        = "Membre Lock Down"
  permissions = 0
  color       = 3447003
  hoist       = true
  mentionable = false
}

resource "discord_role" "lock_down_staff_role" {
  server_id   = var.server_id
  name        = "Staff Lock Down"
  permissions = 2248741901291529 # + Manage Roles (268435456)
  color       = 15105570
  hoist       = true
  mentionable = true
}

# Urssaf
resource "discord_role" "urssaf_membre_role" {
  server_id   = var.server_id
  name        = "Membre Urssaf"
  permissions = 0
  color       = 15844367
  hoist       = true
  mentionable = false
}

resource "discord_role" "urssaf_staff_role" {
  server_id   = var.server_id
  name        = "Staff Urssaf"
  permissions = 2248741901291529 # + Manage Roles (268435456)
  color       = 15105570
  hoist       = true
  mentionable = true
}

# Exemption PTT (Massup) : ce rôle peut utiliser la détection vocale ; les autres doivent utiliser le push-to-talk.
resource "discord_role" "noptt_role" {
  server_id   = var.server_id
  name        = "noptt"
  permissions = 0
  color       = 0
  hoist       = false
  mentionable = false
}
