variable "api_token_id" {
    type        = string
    description = "ID du token API Proxmox"
    sensitive   = true  
}


variable "endpoint" {
    type        = string
    sensitive   = false
    description = "URL de Proxmox"
}

variable "node_name" {
    type        = string
    description = "Nom du nœud Proxmox cible"
}

variable "datastore_id" {
    type        = string
}