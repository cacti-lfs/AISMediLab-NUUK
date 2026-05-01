module "bastion" {
  providers = {
    proxmox = proxmox.provider_node_vip
  }
  source = "git::https://github.com/cacti-lfs/terraform-module-proxmox.git//vm-clone?ref=main"

  #Node CIBLE
  node_name = var.node_name_linux_2

  #Template SOURCE
  source_vm_id       = var.template_linux_id
  source_node_name   = var.node_name_linux_1
  clone_datastore_id = var.datastore_id
  full_clone         = var.full_clone

  vm_name        = "DEB-BAST-01"
  vm_id          = 441
  vm_description = "Bastion"
  vm_tags        = ["bastion", "vlan40", var.environnement]
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
  vnic_bridge = var.network_v1
  vlan_tag    = var.environnement == "poc" ? 0 : 40

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


  ipv4_address = var.ip_bastion
  ipv4_cidr    = var.ipv4_cidr_vlan40
  ipv4_gateway = var.gateway_vlan40

  dns_domain  = "nuuk-medilab.lan"
  dns_servers = ["1.1.1.1", "8.8.8.8"] # Temporaire avant de mettre les IPs de nos DNS interne
}

module "dhcp_1" {
  providers = {
    proxmox = proxmox.provider_node_vip
  }
  source = "git::https://github.com/cacti-lfs/terraform-module-proxmox.git//vm-clone?ref=main"

  #Node CIBLE
  node_name = var.node_name_linux_1

  #Template SOURCE
  source_vm_id       = var.template_linux_id
  source_node_name   = var.node_name_linux_1
  clone_datastore_id = var.datastore_id
  full_clone         = var.full_clone

  vm_name        = "DEB-DHCP-01"
  vm_id          = 771
  vm_description = "Kea DHCP"
  vm_tags        = ["kea", "vlan70", var.environnement]
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
  vlan_tag    = var.environnement == "poc" ? 0 : 70

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


  ipv4_address = var.ip_dhcp_01
  ipv4_cidr    = var.ipv4_cidr_vlan70
  ipv4_gateway = var.gateway_vlan70

  dns_domain  = "nuuk-medilab.lan"
  dns_servers = ["1.1.1.1", "8.8.8.8"] # Temporaire avant de mettre les IPs de nos DNS interne
}

module "dhcp_2" {
  providers = {
    proxmox = proxmox.provider_node_vip
  }
  source = "git::https://github.com/cacti-lfs/terraform-module-proxmox.git//vm-clone?ref=main"

  #Node CIBLE
  node_name = var.node_name_linux_2

  #Template SOURCE
  source_vm_id       = var.template_linux_id
  source_node_name   = var.node_name_linux_1
  clone_datastore_id = var.datastore_id
  full_clone         = var.full_clone

  vm_name        = "DEB-DHCP-02"
  vm_id          = 772
  vm_description = "Kea DHCP"
  vm_tags        = ["kea", "vlan70", var.environnement]
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
  vlan_tag    = var.environnement == "poc" ? 0 : 70

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


  ipv4_address = var.ip_dhcp_02
  ipv4_cidr    = var.ipv4_cidr_vlan70
  ipv4_gateway = var.gateway_vlan70

  dns_domain  = "nuuk-medilab.lan"
  dns_servers = ["1.1.1.1", "8.8.8.8"] # Temporaire avant de mettre les IPs de nos DNS interne
}

module "dns_1" {
  providers = {
    proxmox = proxmox.provider_node_vip
  }
  source = "git::https://github.com/cacti-lfs/terraform-module-proxmox.git//vm-clone?ref=main"

  #Node CIBLE
  node_name = var.node_name_linux_1

  #Template SOURCE
  source_vm_id       = var.template_linux_id
  source_node_name   = var.node_name_linux_1
  clone_datastore_id = var.datastore_id
  full_clone         = var.full_clone

  vm_name        = "DEB-DNS-01"
  vm_id          = 775
  vm_description = "DNS"
  vm_tags        = ["kea", "vlan70", var.environnement]
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
  vlan_tag    = var.environnement == "poc" ? 0 : 70

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


  ipv4_address = var.ip_dns_1
  ipv4_cidr    = var.ipv4_cidr_vlan70
  ipv4_gateway = var.gateway_vlan70

  dns_domain  = "nuuk-medilab.lan"
  dns_servers = ["1.1.1.1", "8.8.8.8"] # Temporaire avant de mettre les IPs de nos DNS interne
}

module "dns_2" {
  providers = {
    proxmox = proxmox.provider_node_vip
  }
  source = "git::https://github.com/cacti-lfs/terraform-module-proxmox.git//vm-clone?ref=main"

  #Node CIBLE
  node_name = var.node_name_linux_2

  #Template SOURCE
  source_vm_id       = var.template_linux_id
  source_node_name   = var.node_name_linux_1
  clone_datastore_id = var.datastore_id
  full_clone         = var.full_clone

  vm_name        = "DEB-DNS-02"
  vm_id          = 774
  vm_description = "DNS"
  vm_tags        = ["kea", "vlan70", var.environnement]
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
  vlan_tag    = var.environnement == "poc" ? 0 : 70

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


  ipv4_address = var.ip_dns_2
  ipv4_cidr    = var.ipv4_cidr_vlan70
  ipv4_gateway = var.gateway_vlan70

  dns_domain  = "nuuk-medilab.lan"
  dns_servers = ["1.1.1.1", "8.8.8.8"] # Temporaire avant de mettre les IPs de nos DNS interne
}

module "ntp_1" {
  providers = {
    proxmox = proxmox.provider_node_vip
  }
  source = "git::https://github.com/cacti-lfs/terraform-module-proxmox.git//vm-clone?ref=main"

  #Node CIBLE
  node_name = var.node_name_linux_2

  #Template SOURCE
  source_vm_id       = var.template_linux_id
  source_node_name   = var.node_name_linux_1
  clone_datastore_id = var.datastore_id
  full_clone         = var.full_clone

  vm_name        = "DEB-NTP-01"
  vm_id          = 774
  vm_description = "NTP"
  vm_tags        = ["ntp", "vlan70", var.environnement]
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
  vlan_tag    = var.environnement == "poc" ? 0 : 70

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


  ipv4_address = var.ip_ntp_1
  ipv4_cidr    = var.ipv4_cidr_vlan70
  ipv4_gateway = var.gateway_vlan70

  dns_domain  = "nuuk-medilab.lan"
  dns_servers = ["1.1.1.1", "8.8.8.8"] # Temporaire avant de mettre les IPs de nos DNS interne
}

# AD 1 + 2 + RODC