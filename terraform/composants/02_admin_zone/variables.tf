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
variable "network_v2" {
  type = string
}
variable "gateway_vlan120" {
  type = string
}
variable "full_clone" {
  type    = bool
  default = true
}
variable "ipv4_cidr_vlan120" {
  type    = string
  default = "28"
}
variable "environnement" {
  type    = string
  default = "nuuk"
}
variable "ip_haproxy_1" {
  type = string
}
variable "ip_haproxy_2" {
  type = string
}
variable "ip_grafana" {
  type = string
}
variable "ipv4_cidr_vlan50" {
  type    = string
  default = "27"
}
variable "gateway_vlan50" {
  type = string
}
variable "ip_zabbix" {
  type = string
}
variable "ip_phpipam" {
  type = string
}
variable "ip_bookstack" {
  type = string
}
variable "ip_glpi" {
  type = string
}
variable "ip_bdd_adm_1" {
  type = string
}
variable "ip_bdd_adm_2" {
  type = string
}
variable "ip_bdd_adm_3" {
  type = string
}
variable "ipv4_cidr_vlan150" {
  type    = string
  default = "28"
}
variable "gateway_vlan150" {
  type = string
}