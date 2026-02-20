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
}

variable "node_name_2" {
  type        = string
  description = "Nom du second nœud Proxmox"
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
}

variable "gateway_vlan40" {
  type        = string
  description = "Passerelle réseau pour le VLAN 40 (Bastion)"
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
}

variable "bastion_vip" {
  type        = string
  description = "VIP (Virtual IP) du cluster Bastion pour SSH ProxyJump"
}
variable "ip_bastion_01" {
  type        = string
  description = "Adresse IP de la VM Bastion 01" 
}
variable "ip_bastion_02" {
  type        = string
  description = "Adresse IP de la VM Bastion 01" 
}
variable "network_v1" {
  type = string
  description = "Carte Réseau 1"
}