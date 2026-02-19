# main.tf - Configuration principale simplifiée
# Les locals (VLAN mapping, VMs) sont maintenant dans locals.tf
# Les variables sont dans variables.tf

# ============================================================================
# MODULE: BASTION (VLAN 40)
# VM ID: 400-499
# ============================================================================
module "bastions" {
  for_each = local.bastion_vms
  source   = "./modules/inst_linux"

  vm_name = "DEB-BAST-${each.key}"
  vm_id   = 400 + tonumber(each.key)

  node_name = each.value.node_name

  template_id  = local.node_template_map[each.value.node_name]
  datastore_id = var.datastore_id

  ipv4_address = each.value.ipv4_address
  cidr         = "/28"
  gateway      = local.vlan_gateway_map[tostring(each.value.vlan_id)]
  vlan_id      = each.value.vlan_id

  network_bridge = local.vlan_bridge_map[tostring(each.value.vlan_id)]

  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.cpu_cores
  memory          = var.memory
  disk_size       = var.disk_size

  tags = merge(
    var.tags,
    {
      "Component" = "Bastion"
      "VLAN"      = each.value.vlan_id
    }
  )
}

# ============================================================================
# MODULE: DHCP (VLAN 70)
# VM ID: 1700-1799
# ============================================================================
module "dhcp_vms" {
  for_each = local.dhcp_vms
  source   = "./modules/inst_linux"

  vm_name = "DEB-DHCP-${each.key}"
  vm_id   = 1700 + tonumber(each.key)

  node_name = each.value.node_name

  template_id  = local.node_template_map[each.value.node_name]
  datastore_id = var.datastore_id

  ipv4_address = each.value.ipv4_address
  cidr         = "/26"
  gateway      = local.vlan_gateway_map[tostring(each.value.vlan_id)]
  vlan_id      = each.value.vlan_id

  network_bridge = local.vlan_bridge_map[tostring(each.value.vlan_id)]

  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.cpu_cores
  memory          = var.memory
  disk_size       = var.disk_size

  tags = merge(
    var.tags,
    {
      "Component" = "DHCP"
      "VLAN"      = each.value.vlan_id
    }
  )
}

# ============================================================================
# MODULE: HA / LOAD BALANCER (VLAN 120)
# VM ID: 1200-1299
# ============================================================================
module "ha_vms" {
  for_each = local.ha_vms
  source   = "./modules/inst_linux"

  vm_name = "DEB-HA-${each.key}"
  vm_id   = 1200 + tonumber(each.key)

  node_name = each.value.node_name

  template_id  = local.node_template_map[each.value.node_name]
  datastore_id = var.datastore_id

  ipv4_address = each.value.ipv4_address
  cidr         = "/28"
  gateway      = local.vlan_gateway_map[tostring(each.value.vlan_id)]
  vlan_id      = each.value.vlan_id

  network_bridge = local.vlan_bridge_map[tostring(each.value.vlan_id)]

  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.cpu_cores
  memory          = var.memory
  disk_size       = var.disk_size

  tags = merge(
    var.tags,
    {
      "Component" = "HA/LB"
      "VLAN"      = each.value.vlan_id
    }
  )
}

# ============================================================================
# MODULE: IPAM (VLAN 70)
# VM ID: 700-799
# ============================================================================
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
  gateway      = local.vlan_gateway_map[tostring(each.value.vlan_id)]
  vlan_id      = each.value.vlan_id

  network_bridge = local.vlan_bridge_map[tostring(each.value.vlan_id)]

  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.cpu_cores
  memory          = var.memory
  disk_size       = var.disk_size

  tags = merge(
    var.tags,
    {
      "Component" = "IPAM"
      "VLAN"      = each.value.vlan_id
    }
  )
}

# ============================================================================
# MODULE: MONITORING (VLAN 60)
# VM ID: 600-699
# ============================================================================
module "mon_vms" {
  for_each = local.mon_vms
  source   = "./modules/inst_linux"

  vm_name = "DEB-MON-${each.key}"
  vm_id   = 600 + tonumber(each.key)

  node_name = each.value.node_name

  template_id  = local.node_template_map[each.value.node_name]
  datastore_id = var.datastore_id

  ipv4_address = each.value.ipv4_address
  cidr         = "/28"
  gateway      = local.vlan_gateway_map[tostring(each.value.vlan_id)]
  vlan_id      = each.value.vlan_id

  network_bridge = local.vlan_bridge_map[tostring(each.value.vlan_id)]

  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.cpu_cores
  memory          = var.memory
  disk_size       = var.disk_size

  tags = merge(
    var.tags,
    {
      "Component" = "Monitoring"
      "VLAN"      = each.value.vlan_id
    }
  )
}

# ============================================================================
# MODULE: ADMINISTRATION (VLAN 50)
# VM ID: 510-599
# ============================================================================
module "adm_vms" {
  for_each = local.adm_vms
  source   = "./modules/inst_linux"

  vm_name = "DEB-ADM-${each.key}"
  vm_id   = 510 + tonumber(each.key)

  node_name = each.value.node_name

  template_id  = local.node_template_map[each.value.node_name]
  datastore_id = var.datastore_id

  ipv4_address = each.value.ipv4_address
  cidr         = "/28"
  gateway      = local.vlan_gateway_map[tostring(each.value.vlan_id)]
  vlan_id      = each.value.vlan_id

  network_bridge = local.vlan_bridge_map[tostring(each.value.vlan_id)]

  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.cpu_cores
  memory          = var.memory
  disk_size       = var.disk_size

  tags = merge(
    var.tags,
    {
      "Component" = "Administration"
      "VLAN"      = each.value.vlan_id
    }
  )
}

# ============================================================================
# MODULE: WEB (VLAN 140)
# VM ID: 1400-1499
# ============================================================================
module "web_vms" {
  for_each = local.web_vms
  source   = "./modules/inst_linux"

  vm_name = "DEB-WEB-${each.key}"
  vm_id   = 1400 + tonumber(each.key)

  node_name = each.value.node_name

  template_id  = local.node_template_map[each.value.node_name]
  datastore_id = var.datastore_id

  ipv4_address = each.value.ipv4_address
  cidr         = "/26"
  gateway      = local.vlan_gateway_map[tostring(each.value.vlan_id)]
  vlan_id      = each.value.vlan_id

  network_bridge = local.vlan_bridge_map[tostring(each.value.vlan_id)]

  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.cpu_cores
  memory          = var.memory
  disk_size       = var.disk_size

  tags = merge(
    var.tags,
    {
      "Component" = "Web"
      "VLAN"      = each.value.vlan_id
    }
  )
}

# ============================================================================
# MODULE: SQL DATABASE (VLAN 140)
# VM ID: 1400-1499
# ============================================================================
module "dbsql_vms" {
  for_each = local.dbsql_vms
  source   = "./modules/inst_linux"

  vm_name = "DEB-DBSQL-${each.key}"
  vm_id   = 1400 + tonumber(each.key)

  node_name = each.value.node_name

  template_id  = local.node_template_map[each.value.node_name]
  datastore_id = var.datastore_id

  ipv4_address = each.value.ipv4_address
  cidr         = "/28"
  gateway      = local.vlan_gateway_map[tostring(each.value.vlan_id)]
  vlan_id      = each.value.vlan_id

  network_bridge = local.vlan_bridge_map[tostring(each.value.vlan_id)]

  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.cpu_cores
  memory          = var.memory
  disk_size       = var.disk_size

  tags = merge(
    var.tags,
    {
      "Component" = "Database-SQL"
      "VLAN"      = each.value.vlan_id
    }
  )
}

# ============================================================================
# MODULE: DATABASE ADMIN (VLAN 150)
# VM ID: 1500-1599
# ============================================================================
module "dbadm_vms" {
  for_each = local.dbadm_vms
  source   = "./modules/inst_linux"

  vm_name = "DEB-DBADM-${each.key}"
  vm_id   = 1500 + tonumber(each.key)

  node_name = each.value.node_name

  template_id  = local.node_template_map[each.value.node_name]
  datastore_id = var.datastore_id

  ipv4_address = each.value.ipv4_address
  cidr         = "/28"
  gateway      = local.vlan_gateway_map[tostring(each.value.vlan_id)]
  vlan_id      = each.value.vlan_id

  network_bridge = local.vlan_bridge_map[tostring(each.value.vlan_id)]

  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.cpu_cores
  memory          = var.memory
  disk_size       = var.disk_size

  tags = merge(
    var.tags,
    {
      "Component" = "Database-Admin"
      "VLAN"      = each.value.vlan_id
    }
  )
}

# ============================================================================
# MODULE: LOKI DATABASE (VLAN 160)
# VM ID: 1600-1699
# ============================================================================
module "dbloki_vms" {
  for_each = local.dbloki_vms
  source   = "./modules/inst_linux"

  vm_name = "DEB-DBLOKI-${each.key}"
  vm_id   = 1600 + tonumber(each.key)

  node_name = each.value.node_name

  template_id  = local.node_template_map[each.value.node_name]
  datastore_id = var.datastore_id

  ipv4_address = each.value.ipv4_address
  cidr         = "/28"
  gateway      = local.vlan_gateway_map[tostring(each.value.vlan_id)]
  vlan_id      = each.value.vlan_id

  network_bridge = local.vlan_bridge_map[tostring(each.value.vlan_id)]

  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.cpu_cores
  memory          = var.memory
  disk_size       = var.disk_size

  tags = merge(
    var.tags,
    {
      "Component" = "Database-Loki"
      "VLAN"      = each.value.vlan_id
    }
  )
}
