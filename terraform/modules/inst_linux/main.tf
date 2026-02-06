resource "proxmox_virtual_environment_vm" "linux_vm" {
    name = var.vm_name
    node_name = var.node_name
    vm_id = var.vm_id

    # Configuration CPU & RAM
    cpu {
        cores = var.cpu_cores
        type = "host"
    }

    memory {
        dedicated = var.memory
    }

    # Clonage depuis le template TPL-DEB-13-BASE ou TPL-DEB-13-DOCK
    clone {
        vm_id = var.template_id
        full = true
    }

    # Réseau : Bridge vmbr0 et VLAN éventuel, à adapater selon ta config
    network_device {
        bridge = var.network_bridge
        vlan_id = var.vlan_id
    }

    # Stockage sur NFS
    disk {
        datastore_id = var.datastore_id
        interface = "scsi"
        size = var.disk_size
    }

    # Cloud-Init pour config réseau et autres paramètres à l'init
    initialization {
        datastore_id = var.datastore_id

        ip_config {
            ipv4 {}
        }
    }

    # Ajout de clef SSH pour qu'Ansible puisse se connecter
    # user_account {
    #     ssh_keys = [var.ssh_public_key]
    #     username = "cloudadm"
    # }

}

output "vm_id" {
  # Assure-toi que le nom correspond exactement à la ressource déclarée au début
  value = proxmox_virtual_environment_vm.linux_vm.vm_id
}