module "dhcp_node1" {
  for_each = {
    for k, v in local.dhcp_vms : k => v if v.provider == "provider_node1"
  }
  source = "git::https://github.com/cacti-lfs/terraform-module-proxmox.git//vm-clone?ref=main"

  providers = {
    proxmox = proxmox.provider_node1
  }

  node_name      = each.value.node_name
  vm_name        = "DEB-DHCP-${each.key}"
  vm_id          = 700 + tonumber(each.key)
  vm_description = "DHCP"
  vm_tags        = ["dhcp", "vlan70", var.environnement]
  # vm_bios = "seabios" par défaut
  # vm_machine = "q35" par défaut
  # vm_tablet_device = false par défaut

  # vm_os_type = "l26" par défaut

  # vm_agent_enabled = true par défaut

  source_vm_id = each.value.template_id
  full_clone   = false

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
      disk_size        = 21
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


  user_account_username        = "cloudadm"
  user_account_ssh_public_keys = var.ssh_public_keys


  ipv4_address = each.value.ipv4_address
  ipv4_cidr    = var.ipv4_cidr_70
  ipv4_gateway = var.gateway_vlan70

  dns_domain  = "nuuk-medilab.lan"
  dns_servers = ["1.1.1.1", "8.8.8.8"] # Temporaire avant de mettre les IPs de nos DNS interne
}

module "dhcp_node2" {
  for_each = {
    for k, v in local.dhcp_vms : k => v if v.provider == "provider_node2"
  }
  source = "git::https://github.com/cacti-lfs/terraform-module-proxmox.git//vm-clone?ref=main"

  providers = {
    proxmox = proxmox.provider_node2
  }

  node_name      = each.value.node_name
  vm_name        = "DEB-DHCP-${each.key}"
  vm_id          = 700 + tonumber(each.key)
  vm_description = "DHCP"
  vm_tags        = ["dhcp", "vlan70"]
  # vm_bios = "seabios" par défaut
  # vm_machine = "q35" par défaut
  # vm_tablet_device = false par défaut

  # vm_os_type = "l26" par défaut

  # vm_agent_enabled = true par défaut

  source_vm_id = each.value.template_id
  full_clone   = false

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
      disk_size        = 21
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

  user_account_username        = "cloudadm"
  user_account_ssh_public_keys = var.ssh_public_keys

  ipv4_address = each.value.ipv4_address
  ipv4_cidr    = var.ipv4_cidr_70
  ipv4_gateway = var.gateway_vlan70

  dns_domain  = "nuuk-medilab.lan"
  dns_servers = ["1.1.1.1", "8.8.8.8"] # Temporaire avant de mettre les IPs de nos DNS interne
}

module "addns_node1" {
  for_each = {
    for k, v in local.addns_vms : k => v if v.provider == "provider_node1"
  }
  source = "git::https://github.com/cacti-lfs/terraform-module-proxmox.git//vm-clone?ref=main"

  providers = {
    proxmox = proxmox.provider_node1
  }

  node_name      = each.value.node_name
  vm_name        = "WIN-ADDNS-${each.key}"
  vm_id          = 710 + tonumber(each.key)
  vm_description = "ADDNS"
  vm_tags        = ["addns", "vlan70"]
  # vm_bios = "seabios" par défaut
  # vm_machine = "q35" par défaut
  # vm_tablet_device = false par défaut

  vm_os_type = "win10"

  vm_agent_enabled = true

  source_vm_id = each.value.template_id
  full_clone   = true

  vm_cpu_cores = 2
  # vm_cpu_type = "host" par défaut
  # vm_cpu_numa = false par défaut

  vm_memory_dedicated = 4096
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
      disk_size        = 35
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

  user_account_username        = "cloudadm"
  user_account_ssh_public_keys = var.ssh_public_keys

  ipv4_address = each.value.ipv4_address
  ipv4_cidr    = var.ipv4_cidr_70
  ipv4_gateway = var.gateway_vlan70

  dns_domain  = "nuuk-medilab.lan"
  dns_servers = ["1.1.1.1", "8.8.8.8"] # Temporaire avant de mettre les IPs de nos DNS interne
}

module "addns_node2" {
  for_each = {
    for k, v in local.addns_vms : k => v if v.provider == "provider_node2"
  }
  source = "git::https://github.com/cacti-lfs/terraform-module-proxmox.git//vm-clone?ref=main"

  providers = {
    proxmox = proxmox.provider_node2
  }

  node_name      = each.value.node_name
  vm_name        = "WIN-ADDNS-${each.key}"
  vm_id          = 710 + tonumber(each.key)
  vm_description = "ADDNS"
  vm_tags        = ["addns", "vlan70"]
  # vm_bios = "seabios" par défaut
  # vm_machine = "q35" par défaut
  # vm_tablet_device = false par défaut

  vm_os_type = "win10"

  vm_agent_enabled = true

  source_vm_id = each.value.template_id
  full_clone   = true

  vm_cpu_cores = 2
  # vm_cpu_type = "host" par défaut
  # vm_cpu_numa = false par défaut

  vm_memory_dedicated = 2048
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
      disk_size        = 40
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

  user_account_username        = "cloudadm"
  user_account_ssh_public_keys = var.ssh_public_keys

  ipv4_address = each.value.ipv4_address
  ipv4_cidr    = var.ipv4_cidr_70
  ipv4_gateway = var.gateway_vlan70

  dns_domain  = "nuuk-medilab.lan"
  dns_servers = ["1.1.1.1", "8.8.8.8"] # Temporaire avant de mettre les IPs de nos DNS interne
}

module "rsys_node3" {
  for_each = {
    for k, v in local.rsys_vms : k => v if v.provider == "provider_node3"
  }
  source = "git::https://github.com/cacti-lfs/terraform-module-proxmox.git//vm-clone?ref=main"

  providers = {
    proxmox = proxmox.provider_node3
  }

  node_name      = each.value.node_name
  vm_name        = "DEB-RSYS-${each.key}"
  vm_id          = 500 + tonumber(each.key)
  vm_description = "RSYSLOG"
  vm_tags        = ["rsyslog", "vlan50", var.environnement]
  # vm_bios = "seabios" par défaut
  # vm_machine = "q35" par défaut
  # vm_tablet_device = false par défaut

  # vm_os_type = "l26" par défaut

  # vm_agent_enabled = true par défaut

  source_vm_id = each.value.template_id
  full_clone   = false

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
  vlan_tag    = var.environnement == "poc" ? 0 : 50

  disks = [
    {
      disk_interface   = "scsi0"
      disk_size        = 21
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


  user_account_username        = "cloudadm"
  user_account_ssh_public_keys = var.ssh_public_keys


  ipv4_address = each.value.ipv4_address
  ipv4_cidr    = var.ipv4_cidr_50
  ipv4_gateway = var.gateway_vlan70

  dns_domain  = "nuuk-medilab.lan"
  dns_servers = ["1.1.1.1", "8.8.8.8"] # Temporaire avant de mettre les IPs de nos DNS interne
}