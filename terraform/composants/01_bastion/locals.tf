# locals.tf
locals {
    vlan_bridge_map = var.network_v1 # VLAN 40 - Bastion (Sécurité)
    
    node_template_map = {
        (var.node_name_1) = var.template_id_node1
        (var.node_name_2) = var.template_id_node2
    }

    bastion_vm = {
        "01" = {
            ipv4_address = var.ip_bastion_01
            vlan_id      = 40
            node_name    = var.node_name_1
            gateway      = var.gateway_vlan40
        }
        "02" = {
            ipv4_address = var.ip_bastion_02
            vlan_id      = 40
            node_name    = var.node_name_2
            gateway      = var.gateway_vlan40
        }
    }
}