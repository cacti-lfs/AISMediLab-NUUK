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
    default     = ""
}

variable "gateway_vlan40" {
    type        = string
    description = "Passerelle réseau pour le VLAN 40 (Bastion)"
    default     = ""
}

variable "bastion_vip" {
    type        = string
    description = "VIP (Virtual IP) du cluster Bastion pour ProxyJump Ansible"
    default     = ""
}

variable "gateway_vlan50" {
    type        = string
    description = "Passerelle réseau pour le VLAN 50 (Monitoring)"
    default     = ""
}

variable "gateway_vlan70" {
    type        = string
    description = "Passerelle réseau pour le VLAN 70 (DHCP)"
    default     = ""
}

variable "gateway_vlan120" {
    type        = string
    description = "Passerelle réseau pour le VLAN 120 (LB)"
    default     = ""
}

variable "gateway_vlan130" {
    type        = string
    description = "Passerelle réseau pour le VLAN 130 (DMZ)"
    default     = ""
}

variable "gateway_vlan140" {
    type        = string
    description = "Passerelle réseau pour le VLAN 140 (BDD)"
    default     = ""
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