terraform{
    required_providers {
        proxmox = {
            version = "0.94.0"
            source  = "bpg/proxmox"
        }
    }
}
provider "proxmox" {
    endpoint    = var.endpoint
    api_token   = var.api_token_id
    insecure    = true
}