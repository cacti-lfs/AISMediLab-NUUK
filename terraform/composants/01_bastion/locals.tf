# locals.tf
locals {
  node_template_map = {
    (var.node_name_linux_1) = var.template_linux_id_node1
    (var.node_name_linux_2) = var.template_linux_id_node2
    (var.node_name_linux_2) = var.template_linux_id_node3
  }

  bast_vms = {
    "01" = {
      ipv4_address = var.ip_bastion_01
      node_name    = var.node_name_linux_1
      template_id  = var.template_linux_id_node1
      provider     = "provider_node1"
    }
    "02" = {
      ipv4_address = var.ip_bastion_02
      node_name    = var.node_name_linux_2
      template_id  = var.template_linux_id_node2
      provider     = "provider_node2"
    }
  }
}