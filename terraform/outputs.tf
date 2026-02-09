# outputs.tf

# Outputs pour Bastions
output "bastions_info" {
    description = "Informations des VMs Bastions"
    value = {
        for name, vm in module.bastions : name => {
            vm_id   = vm.vm_id
            name    = "DEB-BAST-${name}"
            ip      = local.bastion_vms[name].ipv4_address
            vlan_id = local.bastion_vms[name].vlan_id
        }
    }
}

# Outputs pour DHCP
output "dhcp_vms_info" {
    description = "Informations des VMs DHCP"
    value = {
        for name, vm in module.dhcp_vms : name => {
            vm_id   = vm.vm_id
            name    = "DEB-DHCP-${name}"
            ip      = local.dhcp_vms[name].ipv4_address
            vlan_id = local.dhcp_vms[name].vlan_id
        }
    }
}

# Output pour générer l'inventaire Ansible
output "ansible_inventory" {
    description = "Inventaire Ansible au format JSON"
    value = {
        all = {
            children = {
                bastions = {
                    hosts = {
                        for name, vm in module.bastions : "bastion-${name}" => {
                            ansible_host = local.bastion_vms[name].ipv4_address
                            ansible_user = "cloudadm"
                            vm_id        = vm.vm_id
                            vlan_id      = local.bastion_vms[name].vlan_id
                        }
                    }
                    vars = {
                        ansible_python_interpreter = "/usr/bin/python3"
                        ansible_ssh_common_args    = "-o StrictHostKeyChecking=no"
                    }
                }
                dhcp = {
                    hosts = {
                        for name, vm in module.dhcp_vms : "dhcp-${name}" => {
                            ansible_host = local.dhcp_vms[name].ipv4_address
                            ansible_user = "cloudadm"
                            vm_id        = vm.vm_id
                            vlan_id      = local.dhcp_vms[name].vlan_id
                        }
                    }
                    vars = {
                        ansible_python_interpreter = "/usr/bin/python3"
                        ansible_ssh_common_args    = "-o StrictHostKeyChecking=no"
                    }
                }
            }
        }
    }
}
