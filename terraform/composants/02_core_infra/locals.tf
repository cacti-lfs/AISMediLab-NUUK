locals {
  node_template_map = {
    (var.node_name_1) = var.template_id_node1
    (var.node_name_2) = var.template_id_node1
  }
  dhcp_vm = {
    "01" = {
      ipv4_address = var.ip_dhcp_01
      node_name    = var.node_name_1
    }
    "02" = {
      ipv4_address = var.ip_dhcp_02
      node_name    = var.node_name_2
    }
  }
}
