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
variable "gateway_vlan140" {
  type = string
  description = "VLAN BDD WEB"
}
variable "gateway_vlan150" {
  type = string
  description = "VLAN BDD ADM"
}
variable "gateway_vlan160" {
  type = string
  description = "VLAN BDD MON"
}
variable "ip_bdd_web_01" {
  type = string
}
variable "ip_bdd_web_02" {
  type = string
}
variable "ip_bdd_web_03" {
  type = string
}
variable "ip_bdd_adm_01" {
  type = string
}
variable "ip_bdd_adm_02" {
  type = string
}
variable "ip_bdd_adm_03" {
  type = string
}
variable "ip_bdd_mon_01" {
  type = string
}
variable "ip_bdd_mon_02" {
  type = string
}
variable "ip_bdd_mon_03" {
  type = string
}
variable "full_clone" {
  type    = bool
  default = false
}
variable "ipv4_cidr_bdd_web" {
  type    = string
  default = "/28"
}
variable "ipv4_cidr_bdd_adm" {
  type    = string
  default = "/28"
}
variable "ipv4_cidr_bdd_mon" {
  type    = string
  default = "/28"
}
variable "environnement" {
  type    = string
  default = "poc"
}