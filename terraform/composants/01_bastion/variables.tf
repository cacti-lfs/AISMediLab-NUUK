variable "proxmox_api_token_id" {
  type      = string
  sensitive = true
}
variable "proxmox_api_url" {
  type = string
}
variable "ssh_public_keys" {
  type = list(string)
}
variable "node_name_1" {
  type = string
}
variable "node_name_2" {
  type = string
}
variable "template_id_node1" {
  type    = number
  default = 9001
}
variable "template_id_node2" {
  type    = number
  default = 9000
}
variable "datastore_id" {
  type = string
}
variable "network_v1" {
  type = string
}
variable "gateway_vlan40" {
  type = string
}
variable "ip_bastion_01" {
  type = string
}
variable "ip_bastion_02" {
  type = string
}
variable "full_clone" {
  type    = bool
  default = false
}
variable "ipv4_cidr" {
  type    = string
  default = "/28"
}