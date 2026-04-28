variable "proxmox_api_token_id" {
  type      = string
  sensitive = true
}
variable "proxmox_api_token_secret" {
  type      = string
  sensitive = true
}
variable "proxmox_api_user" {
  type = string
}
variable "ssh_public_keys" {
  type = list(string)
}
variable "node_name_linux_1" {
  type = string
}
variable "node_name_linux_2" {
  type = string
}
variable "node_name_linux_3" {
  type = string
}
variable "template_linux_id" {
  type    = number
  default = 9001
}
variable "datastore_id" {
  type = string
}
variable "network_v1" {
  type = string
}
variable "network_v2" {
  type = string
}
variable "gateway_vlan40" {
  type = string
}
variable "gateway_vlan70" {
  type = string
}
variable "ip_bastion" {
  type = string
}
variable "full_clone" {
  type    = bool
  default = true
}
variable "ipv4_cidr_vlan40" {
  type    = string
  default = "28"
}
variable "ipv4_cidr_vlan70" {
  type    = string
  default = "26"
}
variable "environnement" {
  type    = string
  default = "nuuk"
}
variable "ip_dhcp_01" {
  type = string
}
variable "ip_dhcp_02" {
  type = string
}