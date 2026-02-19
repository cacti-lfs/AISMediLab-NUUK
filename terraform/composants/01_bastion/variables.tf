# ============================================================================
# PROXMOX API CREDENTIALS
# ============================================================================

variable "proxmox_api_token_id" {
  type        = string
  description = "ID du token API Proxmox"
  sensitive   = true
}

variable "proxmox_api_url" {
  type        = string
  description = "URL de l'API Proxmox"
  sensitive   = true
}

# ============================================================================
# INFRASTRUCTURE - NŒUDS PROXMOX
# ============================================================================

variable "node_name_1" {
  type        = string
  description = "Nom du premier nœud Proxmox"
  default     = "node1"
}

variable "node_name_2" {
  type        = string
  description = "Nom du second nœud Proxmox"
  default     = "node2"
}

variable "template_id_node1" {
  type        = number
  description = "ID du template Debian sur le nœud 1"
  default     = 9001
}

variable "template_id_node2" {
  type        = number
  description = "ID du template Debian sur le nœud 2"
  default     = 9000
}

variable "datastore_id" {
  type        = string
  description = "ID du datastore pour les VMs"
  default     = "TN-TN1"
}

variable "gateway_vlan40" {
  type        = string
  description = "Passerelle réseau pour le VLAN 40 (Bastion)"
  default     = "192.168.32.62"
}

# ============================================================================
# CONFIGURATION VM
# ============================================================================

variable "cpu_cores" {
  type        = number
  description = "Nombre de cœurs CPU par VM"
  default     = 2
}

variable "memory" {
  type        = number
  description = "Mémoire RAM en MB"
  default     = 1024
}

variable "disk_size" {
  type        = number
  description = "Taille du disque principal en GB"
  default     = 20
}

# ============================================================================
# SSH & ACCÈS
# ============================================================================

variable "ssh_public_keys" {
  type        = list(string)
  description = "Clés publiques SSH pour l'accès aux VMs"
  sensitive   = true
  default = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJb/IgQB8Fc20tSxyVtIX9wHbNOhvTZkytMQjlCKCoen ldutour",
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJb/IgQB8Fc20tSxyVtIX9wHbNOhvTZkytMQjlCKCoen aboulinguiez",
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAI JBFUHhJY3dxvu367nEWbHBNwoEH0I5hnmHKCVbHcobE aliazid"
  ]
}

variable "bastion_vip" {
  type        = string
  description = "VIP (Virtual IP) du cluster Bastion pour SSH ProxyJump"
  default     = "192.168.32.51"
}
