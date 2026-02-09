# main.tf

# --- MAPPING VLAN -> BRIDGE ---
locals {
    vlan_bridge_map = {
        10  = "vmbr0"   # VLAN 10 (accès non documenté, garder sur vmbr0)
        40  = "vmbr1"   # VLAN 40 - Bastion (Sécurité)
        50  = "vmbr1"   # VLAN 50 - Monitoring (Sécurité)
        70  = "vmbr2"   # VLAN 70 - DHCP (LAN interne)
        110 = "vmbr1"   # VLAN 110 - (Sécurité)
        120 = "vmbr2"   # VLAN 120 - LB (LAN interne)
        130 = "vmbr3"   # VLAN 130 - DMZ
        140 = "vmbr2"   # VLAN 140 - BDD (LAN interne)
        80  = "vmbr2"   # VLAN 80 - DHCP (LAN interne)
    }

    bastion_vms = {
        "01" = {
            ipv4_address = "192.168.32.49"
            vlan_id      = 40
            gateway      = var.gateway_vlan40
        }
        "02" = {
            ipv4_address = "192.168.32.50"
            vlan_id      = 40
            gateway      = var.gateway_vlan40
        }
    }
    
    # VMs DHCP (VLAN 70)
    dhcp_vms = {
        "01" = {
            ipv4_address = "192.168.32.193"
            vlan_id      = 70
            gateway      = var.gateway_vlan70
        }
        "02" = {
            ipv4_address = "192.168.32.194"
            vlan_id      = 70
            gateway      = var.gateway_vlan70
        }
    }

    # VMs HA 
    ha_vms = {
        "01" = {
            ipv4_address = "192.168.32.X"
            vlan_id = ""
            gateway = var.gateway_vlan
        }
        "02" = {
            ipv4_address = "192.168.32.X"
            vlan_id = 
            gateway = var.gateway_vlan
        }
    }
}

module "bastions" {
    for_each        = local.bastion_vms
    source          = "./modules/inst_linux"

    vm_name         = "DEB-BAST-${each.key}"
    vm_id           = 400 + tonumber(each.key)
    
    node_name  = var.node_name
    
    template_id     = 9000
    datastore_id    = "TN-TN1"

    ipv4_address    = each.value.ipv4_address
    cidr            = "/24"
    gateway         = each.value.gateway
    vlan_id         = each.value.vlan_id

    network_bridge = local.vlan_bridge_map[each.value.vlan_id]
    
    ssh_public_keys = var.ssh_public_keys
    cpu_cores       = var.cpu_cores
    memory          = var.memory
    disk_size       = var.disk_size
}

module "dhcp_vms" {
    for_each        = local.dhcp_vms
    source          = "./modules/inst_linux"

    vm_name         = "DEB-DHCP-${each.key}"
    vm_id           = 500 + tonumber(each.key)
    
    node_name       = var.node_name
    
    template_id     = 9000
    datastore_id    = "TN-TN1"

    ipv4_address    = each.value.ipv4_address
    cidr            = "/24"
    gateway         = each.value.gateway
    vlan_id         = each.value.vlan_id

    network_bridge  = local.vlan_bridge_map[each.value.vlan_id]
    
    ssh_public_keys = var.ssh_public_keys
    cpu_cores       = var.cpu_cores
    memory          = var.memory
    disk_size       = var.disk_size
}

module "ha_vms" {
    for_each        = local.ha_vms
    source          = "./modules/inst_linux"

    vm_name         = "DEB-HA-${each.key}"
    vm_id           = 

    node_name       = var.node_name

    template_id     = 9000
    datastore_id    = "TN-TN1"

    ipv4_address    = each.value.ipv4_address
    cidr = "/24"
    gateway = each.value.gateway
    vlan_id = each.value.vlan_id

    network_bridge = local.vlan_bridge_map[each.value.vlan_id]

    ssh_public_keys = var.ssh_public_keys
    cpu_cores = var.cpu_cores
    memory = var.memory
    disk_size = var.disk_size

}