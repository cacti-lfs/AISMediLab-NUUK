terraform {
  required_version = ">=1.5.0"
  required_providers {
    proxmox = {
      version = ">=0.100.0"
      source  = "bpg/proxmox"
    }
  }
}

provider "proxmox" {
  alias = "provider_node_vip"
  endpoint  = "https://192.168.32.132:8006"
  api_token = "${var.proxmox_api_user}!${var.proxmox_api_token_id}=${var.proxmox_api_token_secret}"
  insecure  = true

  ssh {
    agent = true
  }
}