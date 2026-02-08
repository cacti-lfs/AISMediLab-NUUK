# main.tf

# --- BASTIONS (VLAN 10) ---
locals {
    bastion_vms = {
        "01" = {
            ipv4_address = "192.168.10.49"
            vlan_id      = 10
            gateway      = var.gateway_vlan10
        }
        "02" = {
            ipv4_address = "192.168.10.50"
            vlan_id      = 10
            gateway      = var.gateway_vlan10
        }
    }
    
    # VMs DHCP (VLAN 80)
    dhcp_vms = {
        "01" = {
            ipv4_address = null
            vlan_id      = 80
            gateway      = var.gateway_vlan80
        }
        "02" = {
            ipv4_address = null
            vlan_id      = 80
            gateway      = var.gateway_vlan80
        }
    }
}

module "bastions" {
    for_each = local.bastion_vms
    source   = "./modules/inst_linux"

    vm_name      = "DEB-BAS-${each.key}"
    vm_id        = 400 + tonumber(each.key)
    
    node_name  = var.node_name
    
    template_id  = 9001
    datastore_id = "TN-TN1"

    ipv4_address = each.value.ipv4_address
    cidr         = "/24"
    gateway      = each.value.gateway
    vlan_id      = each.value.vlan_id

    network_bridge = "vmbr0"
    
    ssh_public_keys = var.ssh_public_keys
    cpu_cores       = var.cpu_cores
    memory          = var.memory
    disk_size       = var.disk_size
}

module "dhcp_vms" {
    for_each = local.dhcp_vms
    source   = "./modules/inst_linux"

    vm_name      = "DEB-DHCP-${each.key}"
    vm_id        = 500 + tonumber(each.key)
    
    node_name  = var.node_name
    
    template_id  = 9001
    datastore_id = "TN-TN1"

    ipv4_address = each.value.ipv4_address
    cidr         = "/24"
    gateway      = each.value.gateway
    vlan_id      = each.value.vlan_id

    network_bridge = "vmbr0"
    
    ssh_public_keys = var.ssh_public_keys
    cpu_cores       = var.cpu_cores
    memory          = var.memory
    disk_size       = var.disk_size
}