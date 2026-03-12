locals {
  node_template_map = {
    (var.node_name_linux_1) = var.template_linux_id_node1
    (var.node_name_linux_2) = var.template_linux_id_node2
    (var.node_name_linux_3) = var.template_linux_id_node3
  }

  bdd_web_vm = {
    "01" = {
      ipv4_address = var.ip_bdd_web_01
      node_name    = var.node_name_linux_1
      template_id  = var.template_linux_id_node1
      provider     = "provider_node1"
    }
    "02" = {
      ipv4_address = var.ip_bdd_web_02
      node_name    = var.node_name_linux_2
      template_id  = var.template_linux_id_node2
      provider     = "provider_node2"
    }
    "03" = {
      ipv4_address = var.ip_bdd_web_03
      node_name    = var.node_name_linux_3
      template_id  = var.template_linux_id_node3
      provider     = "provider_node3"
    }
  }

  bdd_adm_vm = {
    "01" = {
      ipv4_address = var.ip_bdd_adm_01
      node_name    = var.node_name_linux_1
      template_id  = var.template_linux_id_node1
      provider     = "provider_node1"
    }
    "02" = {
      ipv4_address = var.ip_bdd_adm_02
      node_name    = var.node_name_linux_2
      template_id  = var.template_linux_id_node2
      provider     = "provider_node2"
    }
    "03" = {
      ipv4_address = var.ip_bdd_adm_03
      node_name    = var.node_name_linux_3
      template_id  = var.template_linux_id_node3
      provider     = "provider_node3"
    }
  }

  bdd_mon_vm = {
    "01" = {
      ipv4_address = var.ip_bdd_mon_01
      node_name    = var.node_name_linux_1
      template_id  = var.template_linux_id_node1
      provider     = "provider_node1"
    }
    "02" = {
      ipv4_address = var.ip_bdd_mon_02
      node_name    = var.node_name_linux_2
      template_id  = var.template_linux_id_node2
      provider     = "provider_node2"
    }
    "03" = {
      ipv4_address = var.ip_bdd_mon_03
      node_name    = var.node_name_linux_3
      template_id  = var.template_linux_id_node3
      provider     = "provider_node3"
    }
  }
}