variable "pm_api_token_id" {
    type        = string
    description = "ID du token API Proxmox"
}

variable "pm_api_token_secret" {
    type        = string
    sensitive   = true
    description = "Le secret du token"
}

variable "endpoint_proxmox" {
    type = string
    sensitive = false
    description = "URL de Proxmox"
}