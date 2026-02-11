variable "proxmox_api_url" { 
    type = string
}
variable "proxmox_api_token_id" {
    type = string
}
variable "proxmox_api_token_secret" { 
    type = string
    sensitive = true
}
variable "proxmox_node" { 
    type = string 
}
variable "ssh_password" {
    type = string
    sensitive = true
}
variable "iso_url" {
    type = string
}
variable "iso_checksum" {
    type = string
}
variable "vm_name" {
    type = string
}