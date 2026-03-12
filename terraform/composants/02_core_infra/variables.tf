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
variable "proxmox_api_url_node_1" {
  type = string
}
variable "proxmox_api_url_node_2" {
  type = string
}
variable "proxmox_api_url_node_3" {
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
variable "node_name_win_gui_1" {
  type = string
}
variable "node_name_win_core_2" {
  type = string
}
variable "template_linux_id_node1" {
  type    = number
  default = 9001
}
variable "template_linux_id_node2" {
  type    = number
  default = 9000
}
variable "template_linux_id_node3" {
  type    = number
  default = 9003
}
variable "template_win_gui_id_node1" {
  type    = number
  default = 9011
}
variable "template_win_core_id_node2" {
  type    = number
  default = 9012
}
variable "datastore_id" {
  type = string
}
variable "network_v2" {
  type = string
}
variable "network_v1" {
  type = string
}
variable "gateway_vlan70" {
  type = string
}
variable "gateway_vlan50" {
  type = string
}
variable "ip_dhcp_01" {
  type = string
}
variable "ip_dhcp_02" {
  type = string
}
variable "ip_addns_01" {
  type = string
}
variable "ip_addns_02" {
  type = string
}
variable "ip_rsys_01" {
  type = string
}
variable "full_clone" {
  type    = bool
  default = false
}
variable "ipv4_cidr_70" {
  type    = string
  default = "/26"
}
variable "ipv4_cidr_50" {
  type    = string
  default = "/27"
}
variable "environnement" {
  type    = string
  default = "poc"
}