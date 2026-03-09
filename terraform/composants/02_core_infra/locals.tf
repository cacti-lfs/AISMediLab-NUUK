# locals.tf
locals {
  node_template_map = {
    (var.node_name_1) = var.template_id_node1
    (var.node_name_2) = var.template_id_node2
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

  addns_vm = {
    "02" = {
      ipv4_address = var.ip_addns_02
      node_name    = var.node_name_2
    }
  }
}

locals {
  dhcp_node1 = {
    for k, v in local.dhcp_vm :
    k => v if v.node_name == var.node_name_1
  }

  dhcp_node2 = {
    for k, v in local.dhcp_vm :
    k => v if v.node_name == var.node_name_2
  }

  addns_node2 = {
    for k, v in local.addns_vm :
    k => v if v.node_name == var.node_name_2
  }
}