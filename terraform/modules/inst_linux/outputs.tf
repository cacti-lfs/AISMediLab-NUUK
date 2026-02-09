output "vm_name" {
  value = proxmox_virtual_environment_vm.linux_vm.name
}

output "ipv4_address" {
  # On récupère l'IP sans le /CIDR pour qu'Ansible puisse l'utiliser directement
  value = split("/", proxmox_virtual_environment_vm.linux_vm.initialization[0].ip_config[0].ipv4[0].address)[0]
}