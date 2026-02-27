terraform {
  required_providers {
    proxmox = {
      version = "0.94.0"
      source  = "bpg/proxmox"
    }
  }
}

provider "proxmox" {
  endpoint  = var.proxmox_api_url
  api_token = "${var.proxmox_api_user}!${var.proxmox_api_token_id}=${var.proxmox_api_token_secret}"
  insecure  = true

  ssh {
    agent = true
  }
}