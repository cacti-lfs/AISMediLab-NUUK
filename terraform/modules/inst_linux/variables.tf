variable "vm_name"        { 
    type = string
    description = "Nom de la VM"
}
variable "node_name"    { 
    description = "Nom du nœud Proxmox cible"
    type        = string
}
variable "vm_id"          {
    type = number
    description = "ID de la VM"
}
variable "template_id"    { 
    type = number 
    description = "ID du template"
}
variable "datastore_id"   { 
    type = string 
    description = "ID du datastore"
}
variable "ipv4_address"   { 
    type = string 
    description = "Adresse IPv4 de la VM"
}
variable "cidr"           { 
    type = string 
    description = "CIDR de la VM"
}
variable "gateway"        { 
    type = string 
    description = "Passerelle de la VM"
}
variable "network_bridge" { 
    type = string 
    description = "Bridge de la VM"
}
variable "vlan_id"        { 
    type = number 
    default = null 
    description = "ID du VLAN de la VM"
}
variable "cpu_cores"      { 
    type = number
    default = 1 
    description = "Nombre de cœurs CPU de la VM"
}
variable "memory"         { 
    type = number
    default = 1024 
    description = "Mémoire RAM de la VM"
}
variable "disk_size"      { 
    type = number
    default = 10 
    description = "Taille du disque de la VM"
}

variable "ssh_public_keys" {
  description = "Clefs SSH publiques pour cloud-init"
  type        = list(string)
  sensitive   = true
}
