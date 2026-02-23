# ============================================================================
# PROXMOX API & SECRETS
# ============================================================================

variable "proxmox_api_token_id" {
  type        = string
  description = "ID du token API Proxmox"
  sensitive   = true
}

variable "proxmox_api_url" {
  type        = string
  description = "URL de l'API Proxmox"
}

variable "ssh_public_keys" {
  type        = list(string)
  description = "Clés publiques SSH pour l'accès aux VMs"
}

# ============================================================================
# INFRASTRUCTURE PHYSIQUE
# ============================================================================

variable "node_name_1" {
  type        = string
  description = "Nom du premier nœud Proxmox (ex: pve-01)"
}

variable "node_name_2" {
  type        = string
  description = "Nom du second nœud Proxmox (ex: pve-02)"
}

variable "template_id_node1" {
  type        = number
  description = "ID du template Debian sur le nœud 1"
  default = 9001
}

variable "template_id_node2" {
  type        = number
  description = "ID du template Debian sur le nœud 2"
  default = 9000
}

variable "datastore_id" {
  type        = string
  description = "ID du stockage pour les disques des VMs"
}

# ============================================================================
# RÉSEAU (VLAN 40 - BASTION)
# ============================================================================

variable "network_v1" {
  type        = string
  description = "Nom du pont réseau Proxmox (ex: vmbr0)"
}

variable "gateway_vlan40" {
  type        = string
  description = "Passerelle IPv4 pour le VLAN 40"
}

variable "ipv4_address" {
  type        = string
  description = "Adresse IPv4 statique pour la VM"
}

variable "ipv4_cidr" {
  type        = string
  description = "CIDR pour l'adresse IPv4 (ex: /24)"
}

variable "ipv4_gateway" {
  type        = string
  description = "Passerelle IPv4 pour la VM"
}

variable "dns_domain" {
  type        = string
  description = "Domaine DNS pour la VM"
}

variable "dns_servers" {
  type        = list(string)
  description = "Liste des serveurs DNS pour la VM"
}
# ============================================================================
# ADRESSAGE IP (POUR LOCALS)
# ============================================================================

variable "ip_bastion_01" {
  type        = string
  description = "IP statique du Bastion 01"
}

variable "ip_bastion_02" {
  type        = string
  description = "IP statique du Bastion 02"
}

variable "full_clone" {
  type        = bool
  description = "Indique si les VMs doivent être clonées en mode 'full' (true) ou 'linked' (false)"
}

# ============================================================================
# STOCKAGE
# ============================================================================
variable "disks" {
	description = "Liste des disques à attacher à la VM"
	type = list(object({
		disk_storage_id = string
		disk_size       = number
		disk_type       = string
		disk_interface  = string
    disk_file_format = optional(string, "qcow2")
    disk_iothread    = optional(bool, false)
    disk_cache       = optional(string, "none")
    disk_ssd         = optional(bool, false)
    disk_discard     = optional(bool, false)
	}))
	default = []
}

variable "ci_datastore_id" {
  type        = string
  description = "ID du datastore pour les fichiers de configuration cloud-init"
}

variable "ci_meta_data_file_id" {
  type        = string
  description = "ID du fichier de métadonnées cloud-init"
}

variable "ci_network_data_file_id" {
  description = "ID du fichier de configuration réseau cloud-init"
  type        = string
}

variable "ci_user_data_file_id" {
  description = "ID du fichier de données utilisateur cloud-init"
  type        = string
}

variable "ci_vendor_data_file_id" {
  description = "ID du fichier de données fournisseur cloud-init"
  type        = string
}

variable "user_account_username" {
  type        = string
  description = "Nom d'utilisateur pour la VM (cloud-init)"
}

variable "user_account_ssh_public_keys" {
  type        = list(string)
  description = "Clés publiques SSH pour le compte utilisateur de la VM (cloud-init)"
}

variable "ssh_public_keys" {
  type        = list(string)
  description = "Clés publiques SSH pour l'accès aux VMs"
}