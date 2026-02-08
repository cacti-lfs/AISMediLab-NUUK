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

variable "gateway_vlan10" {
    type        = string
    description = "Passerelle réseau pour le VLAN 10 (Bastions)"
}

variable "gateway_vlan80" {
    type        = string
    description = "Passerelle réseau pour le VLAN 80 (DHCP)"
}

variable "cpu_cores" {
    type        = number
    description = "Nombre de cœurs CPU"
    default     = 2
}

variable "memory" {
    type        = number
    description = "Mémoire RAM en MB"
    default     = 2048
}

variable "disk_size" {
    type        = number
    description = "Taille du disque en GB"
    default     = 20
}

variable "ssh_public_keys" {
    type        = list(string)
    description = "Clefs SSH publiques pour cloud-init"
    sensitive   = true
}