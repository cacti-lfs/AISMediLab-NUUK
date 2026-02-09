# ansible.tf - Génère l'inventaire Ansible dynamiquement

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/inventory/inventory_generated.yml"
  
  content = templatefile("${path.module}/inventory.tpl", {
    bastions = {
      for name, vm in module.bastions : "bastion-${name}" => {
        ip      = local.bastion_vms[name].ipv4_address
        vlan_id = local.bastion_vms[name].vlan_id
        vm_id   = vm.vm_id
      }
    }
    dhcp = {
      for name, vm in module.dhcp_vms : "dhcp-${name}" => {
        ip      = local.dhcp_vms[name].ipv4_address
        vlan_id = local.dhcp_vms[name].vlan_id
        vm_id   = vm.vm_id
      }
    }
  })
}

output "ansible_inventory_file" {
  value       = local_file.ansible_inventory.filename
  description = "Chemin vers l'inventaire Ansible généré: ansible/inventory/inventory_generated.yml"
}
