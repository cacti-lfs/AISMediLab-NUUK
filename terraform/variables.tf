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
  default     = "https://proxmox.example.com:8006/api2/json"
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

# ============================================================================
# GATEWAYS RÉSEAU PAR VLAN
# ============================================================================

variable "gateway_vlan40" {
  type        = string
  description = "Passerelle réseau pour le VLAN 40 (Bastion)"
  default     = "192.168.40.1"
}

variable "gateway_vlan50" {
  type        = string
  description = "Passerelle réseau pour le VLAN 50 (Monitoring/Admin)"
  default     = "192.168.50.1"
}

variable "gateway_vlan70" {
  type        = string
  description = "Passerelle réseau pour le VLAN 70 (DHCP)"
  default     = "192.168.70.1"
}

variable "gateway_vlan110" {
  type        = string
  description = "Passerelle réseau pour le VLAN 110"
  default     = "192.168.110.1"
}

variable "gateway_vlan120" {
  type        = string
  description = "Passerelle réseau pour le VLAN 120 (Load Balancer)"
  default     = "192.168.120.1"
}

variable "gateway_vlan130" {
  type        = string
  description = "Passerelle réseau pour le VLAN 130 (DMZ)"
  default     = "192.168.130.1"
}

variable "gateway_vlan140" {
  type        = string
  description = "Passerelle réseau pour le VLAN 140 (Applications)"
  default     = "192.168.140.1"
}

variable "gateway_vlan150" {
  type        = string
  description = "Passerelle réseau pour le VLAN 150 (Database Admin)"
  default     = "192.168.150.1"
}

variable "gateway_vlan160" {
  type        = string
  description = "Passerelle réseau pour le VLAN 160 (Loki Database)"
  default     = "192.168.160.1"
}

# ============================================================================
# CONFIGURATION VM PAR DÉFAUT
# ============================================================================

variable "cpu_cores" {
  type        = number
  description = "Nombre de cœurs CPU par VM"
  default     = 2
  validation {
    condition     = var.cpu_cores >= 1 && var.cpu_cores <= 16
    error_message = "Le nombre de cœurs doit être entre 1 et 16."
  }
}

variable "memory" {
  type        = number
  description = "Mémoire RAM en MB"
  default     = 2048
  validation {
    condition     = var.memory >= 512 && var.memory <= 65536
    error_message = "La mémoire doit être entre 512 MB et 65536 MB."
  }
}

variable "disk_size" {
  type        = number
  description = "Taille du disque principal en GB"
  default     = 30
  validation {
    condition     = var.disk_size >= 10 && var.disk_size <= 500
    error_message = "La taille du disque doit être entre 10 GB et 500 GB."
  }
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
  default     = "192.168.40.1"
}

# ============================================================================
# TAGS & LABELS
# ============================================================================

variable "environment" {
  type        = string
  description = "Environnement de déploiement (test, nuuk, prod, etc.)"
  default     = "test"
  validation {
    condition     = contains(["test", "nuuk", "prod"], var.environment)
    error_message = "L'environnement doit être 'test', 'nuuk' ou 'prod'."
  }
}

variable "project_name" {
  type        = string
  description = "Nom du projet"
  default     = "AISMediLab-NUUK"
}

variable "tags" {
  type        = map(string)
  description = "Tags/Labels à appliquer à toutes les ressources"
  default = {
    "Project"   = "AISMediLab-NUUK"
    "Terraform" = "true"
    "ManagedBy" = "Terraform"
  }
}