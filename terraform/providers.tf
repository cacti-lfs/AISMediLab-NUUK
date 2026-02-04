terraform {
    required_providers {
        proxmox = {
            source  = "Telmate/proxmox"
            version = "3.0.2-rc06"
        }
    }
}

provider "proxmox" {
    pm_api_url      = var.proxmox_pm_api_url
    pm_user         = var.proxmox_pm_user
    pm_password     = var.proxmox_pm_password
    pm_tls_insecure = true
}