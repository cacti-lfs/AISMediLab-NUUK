terraform {
  required_providers {
    proxmox = {
      version = "0.98.0"
      source  = "bpg/proxmox"
    }
  }
}

provider "proxmox" {
  alias     = "provider_node1"
  endpoint  = var.proxmox_api_url_node_1
  api_token = "${var.proxmox_api_user}!${var.proxmox_api_token_id}=${var.proxmox_api_token_secret}"
  insecure  = true

  ssh {
    agent = true
  }
}

provider "proxmox" {
  alias     = "provider_node2"
  endpoint  = var.proxmox_api_url_node_2
  api_token = "${var.proxmox_api_user}!${var.proxmox_api_token_id}=${var.proxmox_api_token_secret}"
  insecure  = true

  ssh {
    agent = true
  }
}

provider "proxmox" {
  alias     = "provider_node3"
  endpoint  = var.proxmox_api_url_node_3
  api_token = "${var.proxmox_api_user}!${var.proxmox_api_token_id}=${var.proxmox_api_token_secret}"
  insecure  = true

  ssh {
    agent = true
  }
}