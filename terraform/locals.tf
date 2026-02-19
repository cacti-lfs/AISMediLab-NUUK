# locals.tf - Configuration centralisée des VLANs, nodes et VMs

# --- MAPPING VLAN -> BRIDGE ---
# Associe chaque VLAN à un bridge réseau physique
locals {
  vlan_bridge_map = {
    "10"  = "vmbr0" # VLAN 10 (accès non documenté, garder sur vmbr0)
    "40"  = "vmbr1" # VLAN 40 - Bastion (Sécurité)
    "50"  = "vmbr1" # VLAN 50 - Monitoring (Sécurité)
    "60"  = "vmbr1" # VLAN 60 - Monitoring (Sécurité)
    "70"  = "vmbr2" # VLAN 70 - DHCP (LAN interne)
    "80"  = "vmbr2" # VLAN 80 - DHCP (LAN interne)
    "110" = "vmbr4" # VLAN 110 - (Sécurité)
    "120" = "vmbr2" # VLAN 120 - LB (LAN interne)
    "130" = "vmbr3" # VLAN 130 - DMZ
    "140" = "vmbr2" # VLAN 140 - BDD (LAN interne)
    "150" = "vmbr2" # VLAN 150 - BDD (LAN interne)
    "160" = "vmbr2" # VLAN 160 - DB (LAN interne)
  }

  # --- MAPPING VLAN -> PASSERELLE ---
  # Centralise les gateways pour éviter les variables répétées
  vlan_gateway_map = {
    "40"  = var.gateway_vlan40
    "50"  = var.gateway_vlan50
    "60"  = var.gateway_vlan50  # Même gateway que VLAN 50
    "70"  = var.gateway_vlan70
    "80"  = var.gateway_vlan70  # Même gateway que VLAN 70
    "110" = var.gateway_vlan110
    "120" = var.gateway_vlan120
    "130" = var.gateway_vlan130
    "140" = var.gateway_vlan140
    "150" = var.gateway_vlan150
    "160" = var.gateway_vlan160
  }
}

# --- ASSOCIATION NOEUD -> TEMPLATE ID ---
# Un template doit exister sur le nœud cible
locals {
  node_template_map = {
    (var.node_name_1) = var.template_id_node1
    (var.node_name_2) = var.template_id_node2
  }
}

# --- VMs PAR COMPOSANT ---
# Structure: { "numero" = { ipv4_address, vlan_id, node_name } }

# Bastion (VLAN 40) - VM ID: 400-499
locals {
  bastion_vms = {
    "01" = {
      ipv4_address = "192.168.32.49"
      vlan_id      = 40
      node_name    = var.node_name_1
    }
    "02" = {
      ipv4_address = "192.168.32.50"
      vlan_id      = 40
      node_name    = var.node_name_2
    }
  }
}

# DHCP (VLAN 70) - VM ID: 1700-1799
locals {
  dhcp_vms = {
    "01" = {
      ipv4_address = "192.168.32.193"
      vlan_id      = 70
      node_name    = var.node_name_1
    }
    "02" = {
      ipv4_address = "192.168.32.194"
      vlan_id      = 70
      node_name    = var.node_name_2
    }
  }
}

# HA / Load Balancer (VLAN 120) - VM ID: 1200-1299
locals {
  ha_vms = {
    "01" = {
      ipv4_address = "192.168.32.97"
      vlan_id      = 120
      node_name    = var.node_name_1
    }
    "02" = {
      ipv4_address = "192.168.32.98"
      vlan_id      = 120
      node_name    = var.node_name_2
    }
  }
}

# IPAM (VLAN 70) - VM ID: 700-799
locals {
  ipam_vm = {
    "01" = {
      ipv4_address = "192.168.32.197"
      vlan_id      = 70
      node_name    = var.node_name_2
    }
  }
}

# Monitoring (VLAN 60) - VM ID: 600-699
locals {
  mon_vms = {
    "01" = {
      ipv4_address = "192.168.35.225"
      vlan_id      = 60
      node_name    = var.node_name_1
    }
    "02" = {
      ipv4_address = "192.168.35.226"
      vlan_id      = 60
      node_name    = var.node_name_2
    }
  }
}

# Administration / Bastion Admin (VLAN 50) - VM ID: 510-599
locals {
  adm_vms = {
    "01" = {
      ipv4_address = "192.168.32.209"
      vlan_id      = 50
      node_name    = var.node_name_1
    }
    "02" = {
      ipv4_address = "192.168.32.210"
      vlan_id      = 50
      node_name    = var.node_name_2
    }
  }
}

# Web (VLAN 140) - VM ID: 1400-1499
locals {
  web_vms = {
    "01" = {
      ipv4_address = "192.168.35.193"
      vlan_id      = 140
      node_name    = var.node_name_1
    }
    "02" = {
      ipv4_address = "192.168.35.194"
      vlan_id      = 140
      node_name    = var.node_name_2
    }
  }
}

# SQL Database (VLAN 140) - VM ID: 1400-1499
locals {
  dbsql_vms = {
    "01" = {
      ipv4_address = "192.168.35.193"
      vlan_id      = 140
      node_name    = var.node_name_1
    }
    "02" = {
      ipv4_address = "192.168.35.194"
      vlan_id      = 140
      node_name    = var.node_name_2
    }
  }
}

# Database Admin (VLAN 150) - VM ID: 1500-1599
locals {
  dbadm_vms = {
    "01" = {
      ipv4_address = "192.168.35.225"
      vlan_id      = 150
      node_name    = var.node_name_1
    }
    "02" = {
      ipv4_address = "192.168.35.226"
      vlan_id      = 150
      node_name    = var.node_name_2
    }
  }
}

# Loki Database (VLAN 160) - VM ID: 1600-1699
locals {
  dbloki_vms = {
    "01" = {
      ipv4_address = "192.168.35.227"
      vlan_id      = 160
      node_name    = var.node_name_1
    }
    "02" = {
      ipv4_address = "192.168.35.228"
      vlan_id      = 160
      node_name    = var.node_name_2
    }
  }
}

# --- HELPER LOCALS ---
# Fonction helper pour récupérer le bridge d'un VLAN
locals {
  get_bridge = lambda($vlan_id) {
    vlan_id = local.vlan_bridge_map[tostring($vlan_id)]
  }
  
  # Fonction helper pour récupérer la gateway d'un VLAN
  get_gateway = lambda($vlan_id) {
    gateway = local.vlan_gateway_map[tostring($vlan_id)]
  }
}
