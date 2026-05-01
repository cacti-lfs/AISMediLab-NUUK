module "haproxy_1" {
  providers = {
    proxmox = proxmox.provider_node_vip
  }
  source = "git::https://github.com/cacti-lfs/terraform-module-proxmox.git//vm-clone?ref=main"

  #NODE CIBLE
  node_name = var.node_name_linux_1

  #Template SOURCE
  source_vm_id       = var.template_linux_id
  source_node_name   = var.node_name_linux_1
  clone_datastore_id = var.datastore_id
  full_clone         = var.full_clone

  vm_name        = "DEB-HAADMIN-1"
  vm_id          = 1201
  vm_description = "VM HAProxy 1 pour la zone admin"
  vm_tags        = ["admin", "vlan120", var.environnement]
  # vm_bios = "seabios" par défaut
  # vm_machine = "q35" par défaut
  # vm_tablet_device = false par défaut

  # vm_os_type = "l26" par défaut

  # vm_agent_enabled = true par défaut


  vm_cpu_cores = 2
  # vm_cpu_type = "host" par défaut
  # vm_cpu_numa = false par défaut

  vm_memory_dedicated = 1024
  # vm_memory_floating = false par défaut

  #numa = false par défaut

  # vm_vga_type = "std" par défaut
  vm_vga_memory = 16

  # bios = "seabios" par défaut
  # efi_disk_storage_id = null par défaut
  # efi_disk_format = "qcow2" par défaut
  # efi_disk_type = "disk" par défaut
  # efi_disk_pre_enrolled_keys = false par défaut

  vnic_model  = "virtio" # e1000 par défaut
  vnic_bridge = var.network_v2
  vlan_tag    = var.environnement == "poc" ? 0 : 120

  disks = [
    {
      disk_interface   = "scsi0"
      disk_size        = 20
      disk_storage_id  = var.datastore_id
      disk_type        = "disk"
      disk_file_format = "raw"
    }
  ]

  ci_datastore_id         = var.datastore_id
  ci_meta_data_file_id    = ""
  ci_network_data_file_id = ""
  ci_vendor_data_file_id  = ""
  ci_user_data_file_id    = ""

  ha_enabled = false
  ha_state   = "started"


  user_account_username        = "cloudadm"
  user_account_ssh_public_keys = var.ssh_public_keys


  ipv4_address = var.ip_haproxy_1
  ipv4_cidr    = var.ipv4_cidr_vlan120
  ipv4_gateway = var.gateway_vlan120

  dns_domain  = "nuuk-medilab.lan"
  dns_servers = ["1.1.1.1", "8.8.8.8"] # Temporaire avant de mettre les IPs de nos DNS interne
}

module "haproxy_2" {
  providers = {
    proxmox = proxmox.provider_node_vip
  }
  source = "git::https://github.com/cacti-lfs/terraform-module-proxmox.git//vm-clone?ref=main"

  #NODE CIBLE
  node_name = var.node_name_linux_2

  #Template SOURCE
  source_vm_id       = var.template_linux_id
  source_node_name   = var.node_name_linux_1
  clone_datastore_id = var.datastore_id
  full_clone         = var.full_clone

  vm_name        = "DEB-HAADMIN-2"
  vm_id          = 1202
  vm_description = "VM HAProxy 2 pour la zone admin"
  vm_tags        = ["admin", "vlan120", var.environnement]
  # vm_bios = "seabios" par défaut
  # vm_machine = "q35" par défaut
  # vm_tablet_device = false par défaut

  # vm_os_type = "l26" par défaut

  # vm_agent_enabled = true par défaut


  vm_cpu_cores = 2
  # vm_cpu_type = "host" par défaut
  # vm_cpu_numa = false par défaut

  vm_memory_dedicated = 1024
  # vm_memory_floating = false par défaut

  #numa = false par défaut

  # vm_vga_type = "std" par défaut
  vm_vga_memory = 16

  # bios = "seabios" par défaut
  # efi_disk_storage_id = null par défaut
  # efi_disk_format = "qcow2" par défaut
  # efi_disk_type = "disk" par défaut
  # efi_disk_pre_enrolled_keys = false par défaut

  vnic_model  = "virtio" # e1000 par défaut
  vnic_bridge = var.network_v2
  vlan_tag    = var.environnement == "poc" ? 0 : 120

  disks = [
    {
      disk_interface   = "scsi0"
      disk_size        = 20
      disk_storage_id  = var.datastore_id
      disk_type        = "disk"
      disk_file_format = "raw"
    }
  ]

  ci_datastore_id         = var.datastore_id
  ci_meta_data_file_id    = ""
  ci_network_data_file_id = ""
  ci_vendor_data_file_id  = ""
  ci_user_data_file_id    = ""

  ha_enabled = false
  ha_state   = "started"


  user_account_username        = "cloudadm"
  user_account_ssh_public_keys = var.ssh_public_keys


  ipv4_address = var.ip_haproxy_2
  ipv4_cidr    = var.ipv4_cidr_vlan120
  ipv4_gateway = var.gateway_vlan120

  dns_domain  = "nuuk-medilab.lan"
  dns_servers = ["1.1.1.1", "8.8.8.8"] # Temporaire avant de mettre les IPs de nos DNS interne
}

module "grafana" {
  providers = {
    proxmox = proxmox.provider_node_vip
  }
  source = "git::https://github.com/cacti-lfs/terraform-module-proxmox.git//vm-clone?ref=main"

  #NODE CIBLE
  node_name = var.node_name_linux_2

  #Template SOURCE
  source_vm_id       = var.template_linux_id
  source_node_name   = var.node_name_linux_1
  clone_datastore_id = var.datastore_id
  full_clone         = var.full_clone

  vm_name        = "DEB-GRAFANA-1"
  vm_id          = 51
  vm_description = "VM Grafana"
  vm_tags        = ["supervision", "vlan50", var.environnement]
  # vm_bios = "seabios" par défaut
  # vm_machine = "q35" par défaut
  # vm_tablet_device = false par défaut

  # vm_os_type = "l26" par défaut

  # vm_agent_enabled = true par défaut


  vm_cpu_cores = 2
  # vm_cpu_type = "host" par défaut
  # vm_cpu_numa = false par défaut

  vm_memory_dedicated = 1024
  # vm_memory_floating = false par défaut

  #numa = false par défaut

  # vm_vga_type = "std" par défaut
  vm_vga_memory = 16

  # bios = "seabios" par défaut
  # efi_disk_storage_id = null par défaut
  # efi_disk_format = "qcow2" par défaut
  # efi_disk_type = "disk" par défaut
  # efi_disk_pre_enrolled_keys = false par défaut

  vnic_model  = "virtio" # e1000 par défaut
  vnic_bridge = var.network_v2
  vlan_tag    = var.environnement == "poc" ? 0 : 50

  disks = [
    {
      disk_interface   = "scsi0"
      disk_size        = 20
      disk_storage_id  = var.datastore_id
      disk_type        = "disk"
      disk_file_format = "raw"
    }
  ]

  ci_datastore_id         = var.datastore_id
  ci_meta_data_file_id    = ""
  ci_network_data_file_id = ""
  ci_vendor_data_file_id  = ""
  ci_user_data_file_id    = ""

  ha_enabled = true
  ha_state   = "started"


  user_account_username        = "cloudadm"
  user_account_ssh_public_keys = var.ssh_public_keys


  ipv4_address = var.ip_grafana
  ipv4_cidr    = var.ipv4_cidr_vlan50
  ipv4_gateway = var.gateway_vlan50

  dns_domain  = "nuuk-medilab.lan"
  dns_servers = ["1.1.1.1", "8.8.8.8"] # Temporaire avant de mettre les IPs de nos DNS interne
}

module "zabbix" {
  providers = {
    proxmox = proxmox.provider_node_vip
  }
  source = "git::https://github.com/cacti-lfs/terraform-module-proxmox.git//vm-clone?ref=main"

  #NODE CIBLE
  node_name = var.node_name_linux_2

  #Template SOURCE
  source_vm_id       = var.template_linux_id
  source_node_name   = var.node_name_linux_1
  clone_datastore_id = var.datastore_id
  full_clone         = var.full_clone

  vm_name        = "DEB-ZABBIX-1"
  vm_id          = 52
  vm_description = "VM Zabbix"
  vm_tags        = ["supervision", "vlan50", var.environnement]
  # vm_bios = "seabios" par défaut
  # vm_machine = "q35" par défaut
  # vm_tablet_device = false par défaut

  # vm_os_type = "l26" par défaut

  # vm_agent_enabled = true par défaut


  vm_cpu_cores = 2
  # vm_cpu_type = "host" par défaut
  # vm_cpu_numa = false par défaut

  vm_memory_dedicated = 1024
  # vm_memory_floating = false par défaut

  #numa = false par défaut

  # vm_vga_type = "std" par défaut
  vm_vga_memory = 16

  # bios = "seabios" par défaut
  # efi_disk_storage_id = null par défaut
  # efi_disk_format = "qcow2" par défaut
  # efi_disk_type = "disk" par défaut
  # efi_disk_pre_enrolled_keys = false par défaut

  vnic_model  = "virtio" # e1000 par défaut
  vnic_bridge = var.network_v2
  vlan_tag    = var.environnement == "poc" ? 0 : 50

  disks = [
    {
      disk_interface   = "scsi0"
      disk_size        = 20
      disk_storage_id  = var.datastore_id
      disk_type        = "disk"
      disk_file_format = "raw"
    }
  ]

  ci_datastore_id         = var.datastore_id
  ci_meta_data_file_id    = ""
  ci_network_data_file_id = ""
  ci_vendor_data_file_id  = ""
  ci_user_data_file_id    = ""

  ha_enabled = true
  ha_state   = "started"


  user_account_username        = "cloudadm"
  user_account_ssh_public_keys = var.ssh_public_keys


  ipv4_address = var.ip_zabbix
  ipv4_cidr    = var.ipv4_cidr_vlan50
  ipv4_gateway = var.gateway_vlan50

  dns_domain  = "nuuk-medilab.lan"
  dns_servers = ["1.1.1.1", "8.8.8.8"] # Temporaire avant de mettre les IPs de nos DNS interne
}

module "phpipam" {
  providers = {
    proxmox = proxmox.provider_node_vip
  }
  source = "git::https://github.com/cacti-lfs/terraform-module-proxmox.git//vm-clone?ref=main"

  #NODE CIBLE
  node_name = var.node_name_linux_2

  #Template SOURCE
  source_vm_id       = var.template_linux_id
  source_node_name   = var.node_name_linux_1
  clone_datastore_id = var.datastore_id
  full_clone         = var.full_clone

  vm_name        = "DEB-PHPIPAM-1"
  vm_id          = 53
  vm_description = "VM Zabbix"
  vm_tags        = ["supervision", "vlan50", var.environnement]
  # vm_bios = "seabios" par défaut
  # vm_machine = "q35" par défaut
  # vm_tablet_device = false par défaut

  # vm_os_type = "l26" par défaut

  # vm_agent_enabled = true par défaut


  vm_cpu_cores = 2
  # vm_cpu_type = "host" par défaut
  # vm_cpu_numa = false par défaut

  vm_memory_dedicated = 1024
  # vm_memory_floating = false par défaut

  #numa = false par défaut

  # vm_vga_type = "std" par défaut
  vm_vga_memory = 16

  # bios = "seabios" par défaut
  # efi_disk_storage_id = null par défaut
  # efi_disk_format = "qcow2" par défaut
  # efi_disk_type = "disk" par défaut
  # efi_disk_pre_enrolled_keys = false par défaut

  vnic_model  = "virtio" # e1000 par défaut
  vnic_bridge = var.network_v2
  vlan_tag    = var.environnement == "poc" ? 0 : 50

  disks = [
    {
      disk_interface   = "scsi0"
      disk_size        = 20
      disk_storage_id  = var.datastore_id
      disk_type        = "disk"
      disk_file_format = "raw"
    }
  ]

  ci_datastore_id         = var.datastore_id
  ci_meta_data_file_id    = ""
  ci_network_data_file_id = ""
  ci_vendor_data_file_id  = ""
  ci_user_data_file_id    = ""

  ha_enabled = true
  ha_state   = "started"


  user_account_username        = "cloudadm"
  user_account_ssh_public_keys = var.ssh_public_keys


  ipv4_address = var.ip_phpipam
  ipv4_cidr    = var.ipv4_cidr_vlan50
  ipv4_gateway = var.gateway_vlan50

  dns_domain  = "nuuk-medilab.lan"
  dns_servers = ["1.1.1.1", "8.8.8.8"] # Temporaire avant de mettre les IPs de nos DNS interne
}

module "bookstack" {
  providers = {
    proxmox = proxmox.provider_node_vip
  }
  source = "git::https://github.com/cacti-lfs/terraform-module-proxmox.git//vm-clone?ref=main"

  #NODE CIBLE
  node_name = var.node_name_linux_2

  #Template SOURCE
  source_vm_id       = var.template_linux_id
  source_node_name   = var.node_name_linux_1
  clone_datastore_id = var.datastore_id
  full_clone         = var.full_clone

  vm_name        = "DEB-BOOKSTACK-1"
  vm_id          = 54
  vm_description = "VM Bookstack"
  vm_tags        = ["supervision", "vlan50", var.environnement]
  # vm_bios = "seabios" par défaut
  # vm_machine = "q35" par défaut
  # vm_tablet_device = false par défaut

  # vm_os_type = "l26" par défaut

  # vm_agent_enabled = true par défaut


  vm_cpu_cores = 2
  # vm_cpu_type = "host" par défaut
  # vm_cpu_numa = false par défaut

  vm_memory_dedicated = 1024
  # vm_memory_floating = false par défaut

  #numa = false par défaut

  # vm_vga_type = "std" par défaut
  vm_vga_memory = 16

  # bios = "seabios" par défaut
  # efi_disk_storage_id = null par défaut
  # efi_disk_format = "qcow2" par défaut
  # efi_disk_type = "disk" par défaut
  # efi_disk_pre_enrolled_keys = false par défaut

  vnic_model  = "virtio" # e1000 par défaut
  vnic_bridge = var.network_v2
  vlan_tag    = var.environnement == "poc" ? 0 : 50

  disks = [
    {
      disk_interface   = "scsi0"
      disk_size        = 20
      disk_storage_id  = var.datastore_id
      disk_type        = "disk"
      disk_file_format = "raw"
    }
  ]

  ci_datastore_id         = var.datastore_id
  ci_meta_data_file_id    = ""
  ci_network_data_file_id = ""
  ci_vendor_data_file_id  = ""
  ci_user_data_file_id    = ""

  ha_enabled = true
  ha_state   = "started"


  user_account_username        = "cloudadm"
  user_account_ssh_public_keys = var.ssh_public_keys


  ipv4_address = var.ip_bookstack
  ipv4_cidr    = var.ipv4_cidr_vlan50
  ipv4_gateway = var.gateway_vlan50

  dns_domain  = "nuuk-medilab.lan"
  dns_servers = ["1.1.1.1", "8.8.8.8"] # Temporaire avant de mettre les IPs de nos DNS interne
}