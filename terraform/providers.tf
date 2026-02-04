terraform{
    required_providers {
        proxmox = {
            version = "3.0.2-rc06"
            source = "Telmate/proxmox"
        }
    }
}
provider "proxmox" {
    pm_api_url = var.endpoint_proxmox

    pm_api_token_id= var.pm_api_token_id
    pm_api_token_secret = var.pm_api_token_secret

    pm_tls_insecure = true
}