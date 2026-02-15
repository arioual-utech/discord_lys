# Discord Lys Community – Infrastructure as Code

Configuration Terraform pour le serveur Discord de l’**alliance Lys Community** (inter-guilde).  
Les rôles par guilde sont créés ici et **attribués automatiquement par un bot**.

## Architecture

```
.
├── provider.tf              # Provider Discord + variables (token, server_id)
├── versions.tf              # Terraform Cloud + versions
├── locals.tf                # role_ids, presets de permissions
├── roles.tf                 # Rôles (bot, staff alliance, guildes, membre, incomer)
├── outputs.tf               # server_id, role_ids, channel_ids (pour le bot)
│
├── channels_public.tf       # Public (rules, annonces, chat)
├── channels_staff.tf        # Staff Alliance (staff-général)
│
├── .env.example             # Modèle variables sensibles
├── terraform.tfvars.example # Modèle tfvars (server_id)
└── .github/workflows/terraform.yml  # CI/CD (plan + apply manuel)
```

## Terraform Cloud

Le state est géré sur **Terraform Cloud** :

- Organisation : `arioual`
- Workspace : `discord_alliance`

### Variables

Soit dans le **workspace Terraform Cloud**, soit en **secrets GitHub** (pour la CI) :

| Variable           | Secret GitHub (optionnel) | Sensible |
|--------------------|---------------------------|----------|
| `discord_token`    | `DISCORD_BOT_TOKEN`       | Oui      |
| `server_id`        | `DISCORD_GUILD_ID`        | Non      |

## Rôles

| Rôle                | Usage |
|---------------------|--------|
| **bot**             | Rôle technique pour les bots |
| **admin**           | Admin technique Discord |
| **Conseil**         | Staff alliance (équivalent GM) |
| **Officier Alliance** | Officiers de l’alliance |
| **Lys** (et autres) | Rôles guilde — **attribués par le bot** |
| **Membre**          | Membre de l’alliance |
| **Incomer**         | Nouveaux arrivants |

Pour ajouter une guilde : dupliquer un bloc `discord_role "guilde_xxx_role"` dans `roles.tf` et l’ajouter dans `locals.tf` (`role_ids`) et dans `outputs.tf` (`role_ids`).

## Canaux

| Catégorie       | Canaux |
|-----------------|--------|
| **Public**      | rules, annonces, chat |
| **Staff Alliance** | staff-général (Conseil + Officiers) |

## Utilisation

### Local

```bash
# Option 1 : variables d'environnement
export TF_VAR_discord_token="..."
export TF_VAR_server_id="..."

# Option 2 : terraform.tfvars (copier terraform.tfvars.example)
# Renseigner server_id ; pour le token, garder TF_VAR_discord_token en env.

terraform login   # si Terraform Cloud
terraform init
terraform plan
terraform apply
```

Après le premier `terraform init`, committer `.terraform.lock.hcl` pour figer les versions des providers.

### CI/CD (GitHub Actions)

| Secret            | Description |
|-------------------|-------------|
| `TF_API_TOKEN`    | Token API Terraform Cloud |
| `DISCORD_BOT_TOKEN` | Token du bot Discord (pour plan/apply en CI) |
| `DISCORD_GUILD_ID`  | ID du serveur (Guild ID) |

Si `DISCORD_BOT_TOKEN` et `DISCORD_GUILD_ID` ne sont pas définis, les variables doivent être configurées dans le workspace Terraform Cloud.

| Événement              | Action |
|------------------------|--------|
| Push / PR sur `main`   | Plan automatique (+ commentaire sur les PR) |
| Workflow manuel `apply` | Apply après approbation (environnement `production`) |

**Pour appliquer :** Actions → Terraform → Run workflow → choisir `apply` → approuver.

## Outputs (pour le bot)

Après `terraform apply` (ou en local avec `terraform output`) :

- **server_id** : ID du serveur
- **role_ids** : map des IDs de rôles (bot, conseil, guilde_lys, membre, incomer, etc.)
- **channel_ids** : map des IDs des canaux principaux

Le bot peut utiliser ces IDs en config ou via une intégration (ex. data source Terraform, export JSON, etc.).

## Bot et rôles automatiques

Terraform crée les **rôles** et **canaux** ; l’attribution des rôles (par guilde, sync jeu, réactions, slash commands) est gérée par ton bot en utilisant les noms ou les IDs exposés dans les outputs.

## Provider

[zp-forks/discord](https://registry.terraform.io/providers/zp-forks/discord/latest) ~> 3.1.0
