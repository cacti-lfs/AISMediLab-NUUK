# main.tf

# --- MAPPING VLAN -> BRIDGE ---
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
    "150" = "vmbr2" # VLAN 140 - BDD (LAN interne)
    "160" = "vmbr2" # VLAN 160 - DB (LAN interne)
  }
  # --- ASSOCIATION NOEUD -> TEMPLATE ID ---
  # Un template doit exister sur le nœud cible (ex: 9000 sur PVE1, 9001 sur PVE2).
  node_template_map = {
    (var.node_name_1) = 9001
    (var.node_name_2) = 9000
  }

  # --- VMs BASTION (VLAN 40) ---
  bastion_vms = {
    "01" = {
      ipv4_address = "192.168.32.49"
      vlan_id      = 40
      gateway      = var.gateway_vlan40
      node_name    = var.node_name_1
    }
    "02" = {
      ipv4_address = "192.168.32.50"
      vlan_id      = 40
      gateway      = var.gateway_vlan40
      node_name    = var.node_name_2
    }
  }

  # --- VMs DHCP (VLAN 70) ---
  dhcp_vms = {
    "01" = {
      ipv4_address = "192.168.32.193"
      vlan_id      = 70
      gateway      = var.gateway_vlan70
      node_name    = var.node_name_1
    }
    "02" = {
      ipv4_address = "192.168.32.194"
      vlan_id      = 70
      gateway      = var.gateway_vlan70
      node_name    = var.node_name_2
    }
  }

  # --- VMs HA (VLAN 120) ---
  ha_vms = {
    "01" = {
      ipv4_address = "192.168.32.97"
      vlan_id      = 120
      gateway      = var.gateway_vlan120
      node_name    = var.node_name_1
    }
    "02" = {
      ipv4_address = "192.168.32.98"
      vlan_id      = 120
      gateway      = var.gateway_vlan120
      node_name    = var.node_name_2
    }
  }

  # --- VM IPAM (VLAN 70) ---
  ipam_vm = {
    "01" = {
      ipv4_address = "192.168.32.197"
      vlan_id      = 70
      gateway      = var.gateway_vlan70
      node_name    = var.node_name_2
    }
  }

  # --- VM MONITORING (VLAN 60) ---
  mon_vms = {
    "01" = {
      ipv4_address = "192.168.35.225"
      vlan_id      = 60
      gateway      = var.gateway_vlan50
      node_name    = var.node_name_1
    }
    "02" = {
      ipv4_address = "192.168.35.226"
      vlan_id      = 60
      gateway      = var.gateway_vlan50
      node_name    = var.node_name_2
    }
  }

  # --- VM DOCUMENTATION (VLAN 150) ---
  adm_vms = {
    "01" = {
      ipv4_address = "192.168.32.209"
      vlan_id      = 50
      gateway      = var.gateway_vlan50
      node_name    = var.node_name_1
    }
    "02" = {
      ipv4_address = "192.168.32.210"
      vlan_id      = 50
      gateway      = var.gateway_vlan50
      node_name    = var.node_name_2
    }
  }

  # --- VM WEB (VLAN 140) ---
  web_vms = {
    "01" = {
      ipv4_address = "192.168.35.193"
      vlan_id      = 140
      gateway      = var.gateway_vlan140
      node_name    = var.node_name_1
    }
    "02" = {
      ipv4_address = "192.168.35.194"
      vlan_id      = 140
      gateway      = var.gateway_vlan140
      node_name    = var.node_name_2
    }
    #     "03" = {
    #      ipv4_address = "192.168.35.195"
    #      vlan_id      = 140
    #      gateway      = var.gateway_vlan140
    #      node_name    = var.node_name_2
    #    }
  }

  # --- VM DBSQL (VLAN 140) ---
  dbsql_vms = {
    "01" = {
      ipv4_address = "192.168.35.193"
      vlan_id      = 140
      gateway      = var.gateway_vlan140
      node_name    = var.node_name_1
    }
    "02" = {
      ipv4_address = "192.168.35.194"
      vlan_id      = 140
      gateway      = var.gateway_vlan140
      node_name    = var.node_name_2
    }
    #    "03" = {
    #      ipv4_address = "192.168.35.195"
    #      vlan_id      = 140
    #      gateway      = var.gateway_vlan140
    #      node_name    = var.node_name_2
    #    }
  }

  # --- VM DB VM (VLAN 160) ---
  dbadm_vms = {
    "01" = {
      ipv4_address = "192.168.35.225"
      vlan_id      = 150
      gateway      = var.gateway_vlan150
      node_name    = var.node_name_1
    }
    "02" = {
      ipv4_address = "192.168.35.226"
      vlan_id      = 150
      gateway      = var.gateway_vlan150
      node_name    = var.node_name_2
    }
  }

  # --- VM DB LOKI (VLAN 160) ---
  dbloki_vms = {
    "01" = {
      ipv4_address = "192.168.35.227"
      vlan_id      = 160
      gateway      = var.gateway_vlan160
      node_name    = var.node_name_1
    }
    "02" = {
      ipv4_address = "192.168.35.228"
      vlan_id      = 160
      gateway      = var.gateway_vlan160
      node_name    = var.node_name_2
    }
  }
}

# --- MODULES ---
module "bastions" {
  for_each = local.bastion_vms
  source   = "./modules/inst_linux"

  vm_name = "DEB-BAST-${each.key}"
  vm_id   = 400 + tonumber(each.key)

  node_name = each.value.node_name

  template_id  = local.node_template_map[each.value.node_name]
  datastore_id = var.datastore_id

  ipv4_address = each.value.ipv4_address
  cidr         = "/28" # A modifier
  gateway      = each.value.gateway
  vlan_id      = each.value.vlan_id

  network_bridge = local.vlan_bridge_map[tostring(each.value.vlan_id)]

  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.cpu_cores
  memory          = var.memory
  disk_size       = var.disk_size
}

module "dhcp_vms" {
  for_each = local.dhcp_vms
  source   = "./modules/inst_linux"

  vm_name = "DEB-DHCP-${each.key}"
  vm_id   = 1700 + tonumber(each.key)

  node_name = each.value.node_name

  template_id  = local.node_template_map[each.value.node_name]
  datastore_id = var.datastore_id

  ipv4_address = each.value.ipv4_address
  cidr         = "/26" # A modifier
  gateway      = each.value.gateway
  vlan_id      = each.value.vlan_id

  network_bridge = local.vlan_bridge_map[tostring(each.value.vlan_id)]

  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.cpu_cores
  memory          = var.memory
  disk_size       = var.disk_size
}

module "ha_vms" {
  for_each = local.ha_vms
  source   = "./modules/inst_linux"

  vm_name = "DEB-HA-${each.key}"
  vm_id   = 1200 + tonumber(each.key)

  node_name = each.value.node_name

  template_id  = local.node_template_map[each.value.node_name]
  datastore_id = var.datastore_id

  ipv4_address = each.value.ipv4_address
  cidr         = "/28" # A modifier
  gateway      = each.value.gateway
  vlan_id      = each.value.vlan_id

  network_bridge = local.vlan_bridge_map[tostring(each.value.vlan_id)]

  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.cpu_cores
  memory          = var.memory
  disk_size       = var.disk_size

}

module "ipam_vm" {
  for_each = local.ipam_vm
  source   = "./modules/inst_linux"

  vm_name = "DEB-IPAM-${each.key}"
  vm_id   = 700 + tonumber(each.key)

  node_name = each.value.node_name

  template_id  = local.node_template_map[each.value.node_name]
  datastore_id = var.datastore_id

  ipv4_address = each.value.ipv4_address
  cidr         = "/26"
  gateway      = each.value.gateway
  vlan_id      = each.value.vlan_id

  network_bridge = local.vlan_bridge_map[tostring(each.value.vlan_id)]

  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.cpu_cores
  memory          = var.memory
  disk_size       = var.disk_size
}

module "mon_vms" {
  for_each = local.mon_vms
  source   = "./modules/inst_linux"

  vm_name = "DEB-DB-MON-${each.key}"
  vm_id   = 600 + tonumber(each.key)

  node_name = each.value.node_name

  template_id  = local.node_template_map[each.value.node_name]
  datastore_id = var.datastore_id

  ipv4_address = each.value.ipv4_address
  cidr         = "/28"
  gateway      = each.value.gateway
  vlan_id      = each.value.vlan_id

  network_bridge = local.vlan_bridge_map[tostring(each.value.vlan_id)]

  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.cpu_cores
  memory          = var.memory
  disk_size       = var.disk_size
}

module "adm_vms" {
  for_each = local.adm_vms
  source   = "./modules/inst_linux"

  vm_name = "DEB-DB-ADM-${each.key}"
  vm_id   = 510 + tonumber(each.key)

  node_name = each.value.node_name

  template_id  = local.node_template_map[each.value.node_name]
  datastore_id = var.datastore_id

  ipv4_address = each.value.ipv4_address
  cidr         = "/28"
  gateway      = each.value.gateway
  vlan_id      = each.value.vlan_id

  network_bridge = local.vlan_bridge_map[tostring(each.value.vlan_id)]

  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.cpu_cores
  memory          = var.memory
  disk_size       = var.disk_size
}

module "web_vms" {
  for_each = local.web_vms
  source   = "./modules/inst_linux"

  vm_name = "DEB-DB-WEB-${each.key}"
  vm_id   = 1400 + tonumber(each.key)

  node_name = each.value.node_name

  template_id  = local.node_template_map[each.value.node_name]
  datastore_id = var.datastore_id

  ipv4_address = each.value.ipv4_address
  cidr         = "/26"
  gateway      = each.value.gateway
  vlan_id      = each.value.vlan_id

  network_bridge = local.vlan_bridge_map[tostring(each.value.vlan_id)]

  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.cpu_cores
  memory          = var.memory
  disk_size       = var.disk_size
}

module "dbsql_vms" {
  for_each = local.dbsql_vms
  source   = "./modules/inst_linux"

  vm_name = "DEB-DB-SQL-${each.key}"
  vm_id   = 1400 + tonumber(each.key)

  node_name = each.value.node_name

  template_id  = local.node_template_map[each.value.node_name]
  datastore_id = var.datastore_id

  ipv4_address = each.value.ipv4_address
  cidr         = "/28"
  gateway      = each.value.gateway
  vlan_id      = each.value.vlan_id

  network_bridge = local.vlan_bridge_map[tostring(each.value.vlan_id)]

  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.cpu_cores
  memory          = var.memory
  disk_size       = var.disk_size
}

module "dbadm_vms" {
  for_each = local.dbadm_vms
  source   = "./modules/inst_linux"

  vm_name = "DEB-DB-ADM-${each.key}"
  vm_id   = 1500 + tonumber(each.key)

  node_name = each.value.node_name

  template_id  = local.node_template_map[each.value.node_name]
  datastore_id = var.datastore_id

  ipv4_address = each.value.ipv4_address
  cidr         = "/28"
  gateway      = each.value.gateway
  vlan_id      = each.value.vlan_id

  network_bridge = local.vlan_bridge_map[each.value.vlan_id]

  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.cpu_cores
  memory          = var.memory
  disk_size       = var.disk_size
}

module "dbloki_vms" {
  for_each = local.dbloki_vms
  source   = "./modules/inst_linux"

  vm_name = "DEB-DB-LOKI-${each.key}"
  vm_id   = 1600 + tonumber(each.key)

  node_name = each.value.node_name

  template_id  = local.node_template_map[each.value.node_name]
  datastore_id = var.datastore_id

  ipv4_address = each.value.ipv4_address
  cidr         = "/28"
  gateway      = each.value.gateway
  vlan_id      = each.value.vlan_id

  network_bridge = local.vlan_bridge_map[each.value.vlan_id]

  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.cpu_cores
  memory          = var.memory
  disk_size       = var.disk_size
} 