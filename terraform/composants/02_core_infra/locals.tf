# locals.tf
locals {
  # Mapping des templates par nœud Proxmox (clé = nom réel du nœud)
  template_by_node = {
    (var.node_name_linux_1) = var.template_linux_id_node1
    (var.node_name_linux_2) = var.template_linux_id_node2
    (var.node_name_linux_2) = var.template_linux_id_node3
  }

  # Définition des VMs avec template et nœud explicites
  dhcp_vms = {
    "01" = {
      ipv4_address = var.ip_dhcp_01
      node_name    = var.node_name_linux_1
      template_id  = var.template_linux_id_node1
      provider     = "provider_node1"
    }
    "02" = {
      ipv4_address = var.ip_dhcp_02
      node_name    = var.node_name_linux_2
      template_id  = var.template_linux_id_node2
      provider     = "provider_node2"
    }
  }

  addns_vms = {
    "01" = {
      ipv4_address = var.ip_addns_01
      node_name    = var.node_name_win_gui_1
      template_id  = var.template_win_gui_id_node1
      provider     = "provider_node1"
    }
    "02" = {
      ipv4_address = var.ip_addns_02
      node_name    = var.node_name_win_core_2
      template_id  = var.template_win_core_id_node2
      provider     = "provider_node2"
    }
  }

  rsys_vms = {
    "01" = {
      ipv4_address = var.ip_rsys_01
      node_name    = var.node_name_linux_3
      template_id  = var.template_linux_id_node3
      provider     = "provider_node3"
    }
  }
}