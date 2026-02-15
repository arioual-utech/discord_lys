terraform {
  required_version = ">= 1.0"

  cloud {
    organization = "arioual"
    workspaces {
      name = "discord_alliance"
    }
  }

  required_providers {
    discord = {
      source  = "zp-forks/discord"
      version = "~> 3.1.0"
    }
  }
}
