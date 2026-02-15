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

# --- Staff alliance ---
resource "discord_role" "conseil_role" {
  server_id   = var.server_id
  name        = "Conseil"
  permissions = 8864262743130103
  color       = 16711684
  hoist       = true
  mentionable = true
}

resource "discord_role" "officier_alliance_role" {
  server_id   = var.server_id
  name        = "Officier Alliance"
  permissions = 2248473465835073
  color       = 15105570
  hoist       = true
  mentionable = true
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

# --- Membre alliance (générique) ---
resource "discord_role" "membre_role" {
  server_id   = var.server_id
  name        = "Membre"
  permissions = 40585397784128
  color       = 7419530
  hoist       = false
  mentionable = false
}

resource "discord_role" "incomer_role" {
  server_id   = var.server_id
  name        = "Incomer"
  permissions = 0
  color       = 0
  hoist       = false
  mentionable = false
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
