resource "proxmox_virtual_environnement_vm" "debian_ha_vm" {
    name = "vm-patroni-01"
    node_name = "HYP-PVE1"
    vm_id = 301

    
}