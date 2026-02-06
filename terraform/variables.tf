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

variable "vm_name" {
    type        = string
    description = "Nom de la VM DHCP"
}

variable "target_node" {
    type        = string
    description = "Nom du nœud Proxmox cible"
}

variable "vm_id" {
    type        = number
    description = "ID de la VM DHCP"
}

variable "template_id" {
    type        = number
    description = "ID du template de la VM DHCP"
}

variable "datastore_id" {
    type        = string
    description = "ID du datastore Proxmox pour la VM DHCP"
}

variable "ipv4_address" {
    type        = string
    description = "Adresse IPv4 de la VM DHCP"
}