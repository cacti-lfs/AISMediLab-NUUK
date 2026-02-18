variable "proxmox_api_token_id" {
  type        = string
  description = "ID du token API Proxmox"
  sensitive   = true
}

variable "proxmox_api_url" {
  type        = string
  description = "URL de l'API Proxmox"
  sensitive   = true
  # Remplacer cette valeur par l'URL réelle de l'API Proxmox si besoin
  default     = "https://proxmox.example.com:8006/api2/json"
}

variable "datastore_id" {
  type = string
  description = "ID du datastore des VMs"
  default = "TN-TN1"
}

variable "node_name_1" {
  type        = string
  description = "Nom du premier nœud Proxmox"
  default = "node1"
}

variable "node_name_2" {
  type        = string
  description = "Nom du second nœud Proxmox"
  default = "node2"
}

variable "gateway_vlan40" {
  type        = string
  description = "Passerelle réseau pour le VLAN 40 (Bastion)"
  default     = "192.168.40.1"
}

variable "gateway_vlan50" {
  type        = string
  description = "Passerelle réseau pour le VLAN 50 (Monitoring)"
  default     = "192.168.50.1"
}

variable "gateway_vlan70" {
  type        = string
  description = "Passerelle réseau pour le VLAN 70 (DHCP)"
  default     = "192.168.70.1"
}

variable "gateway_vlan120" {
  type        = string
  description = "Passerelle réseau pour le VLAN 120 (LB)"
  default     = "192.168.120.1"
}

variable "gateway_vlan130" {
  type        = string
  description = "Passerelle réseau pour le VLAN 130 (DMZ)"
  default     = "192.168.130.1"
}

variable "gateway_vlan140" {
  type        = string
  description = "Passerelle réseau pour le VLAN 140 (BDD)"
  default     = "192.168.140.1"
}
variable "gateway_vlan150" {
  type        = string
  description = "Passerelle réseau pour le VLAN 140 (BDD)"
  default     = "192.168.150.1"
}

variable "gateway_vlan160" {
  type        = string
  description = "Passerelle réseau pour le VLAN 160 (SQL Monitoring)"
  default     = "192.168.160.1"
}

variable "bastion_vip" {
  type        = string
  description = "VIP (Virtual IP) du cluster Bastion pour ProxyJump Ansible"
  default     = "192.168.1.51"
}

variable "cpu_cores" {
  type        = number
  description = "Nombre de cœurs CPU"
  default     = 1
}

variable "memory" {
  type        = number
  description = "Mémoire RAM en MB"
  default     = 1024
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
  default = [
  "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJb/IgQB8Fc20tSxyVtIX9wHbNOhvTZkytMQjlCKCoen ldutour",
  "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJb/IgQB8Fc20tSxyVtIX9wHbNOhvTZkytMQjlCKCoen aboulinguiez",
  "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAI JBFUHhJY3dxvu367nEWbHBNwoEH0I5hnmHKCVbHcobE aliazid"
  ]
}