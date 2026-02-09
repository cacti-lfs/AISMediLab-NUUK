---
# Inventaire Ansible - Généré automatiquement par Terraform
# Ne pas éditer manuellement !

all:
  vars:
    ansible_python_interpreter: /usr/bin/python3
    ansible_user: cloudadm
  
  children:
    
    # --- GROUPES PAR FONCTION ---
    bastions:
      hosts:
%{ for hostname, host in bastions ~}
        ${hostname}:
          ansible_host: ${host.ip}
          vm_id: ${host.vm_id}
          vlan_id: ${host.vlan_id}
%{ endfor ~}
      vars:
        group_name: "Bastions"
        role: "bastion"
        vlan: "40"
        ansible_ssh_common_args: "-o StrictHostKeyChecking=no"
    
    dhcp:
      hosts:
%{ for hostname, host in dhcp ~}
        ${hostname}:
          ansible_host: ${host.ip}
          vm_id: ${host.vm_id}
          vlan_id: ${host.vlan_id}
          ansible_ssh_common_args: "-o ProxyCommand='ssh -W %h:%p cloudadm@bastion-01' -o StrictHostKeyChecking=no"
%{ endfor ~}
      vars:
        group_name: "DHCP Servers"
        role: "dhcp"
        vlan: "70"
    
    # --- GROUPES PAR ZONE DE SÉCURITÉ ---
    security:
      children:
        - bastions
      vars:
        zone: "Sécurité"
    
    services:
      children:
        - dhcp
      vars:
        zone: "Services"
