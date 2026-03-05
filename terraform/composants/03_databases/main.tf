module "bdd_web_node1" {
  for_each = local.bdd_web_node1
  source   = "git::https://github.com/cacti-lfs/terraform-module-proxmox.git//vm-clone?ref=main"

  providers = {
    proxmox = proxmox.provider_node1
  }

  node_name      = var.node_name_1
  vm_name        = "DEB-BDD-WEB-${each.key}"
  vm_id          = 1400 + tonumber(each.key)
  vm_description = "BDD-WEB"
  vm_tags        = ["bdd-web", "vlan140"]
  # vm_bios = "seabios" par défaut
  # vm_machine = "q35" par défaut
  # vm_tablet_device = false par défaut

  # vm_os_type = "l26" par défaut

  # vm_agent_enabled = true par défaut

  source_vm_id = local.node_template_map[var.node_name_1]
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
  vlan_tag    = var.environnement == "poc" ? 0 : 140

  disks = [
    {
      disk_interface   = "scsi0"
      disk_size        = 15
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
  ipv4_cidr    = var.ipv4_cidr_bdd_web
  ipv4_gateway = var.gateway_vlan140

  dns_domain  = "nuuk-medilab.lan"
  dns_servers = ["1.1.1.1", "8.8.8.8"] # Temporaire avant de mettre les IPs de nos DNS interne
}

module "bdd_web_node2" {
  for_each = local.bdd_web_node2
  source   = "git::https://github.com/cacti-lfs/terraform-module-proxmox.git//vm-clone?ref=main"

  providers = {
    proxmox = proxmox.provider_node2
  }

  node_name      = var.node_name_2
  vm_name        = "DEB-BDD-WEB-${each.key}"
  vm_id          = 1400 + tonumber(each.key)
  vm_description = "BDD WEB"
  vm_tags        = ["bdd-web", "vlan140"]
  # vm_bios = "seabios" par défaut
  # vm_machine = "q35" par défaut
  # vm_tablet_device = false par défaut

  # vm_os_type = "l26" par défaut

  # vm_agent_enabled = true par défaut

  source_vm_id = local.node_template_map[var.node_name_2]
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
  vlan_tag    = var.environnement == "poc" ? 0 : 140

  disks = [
    {
      disk_interface   = "scsi0"
      disk_size        = 15
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
  ipv4_cidr    = var.ipv4_cidr_bdd_web
  ipv4_gateway = var.gateway_vlan140

  dns_domain  = "nuuk-medilab.lan"
  dns_servers = ["1.1.1.1", "8.8.8.8"] # Temporaire avant de mettre les IPs de nos DNS interne
}

module "bdd_adm_node1" {
  for_each = local.bdd_adm_node1
  source   = "git::https://github.com/cacti-lfs/terraform-module-proxmox.git//vm-clone?ref=main"

  providers = {
    proxmox = proxmox.provider_node1
  }

  node_name      = var.node_name_1
  vm_name        = "DEB-BDD-ADM-${each.key}"
  vm_id          = 1500 + tonumber(each.key)
  vm_description = "BDD-ADM"
  vm_tags        = ["BDD-ADM", "vlan150"]
  # vm_bios = "seabios" par défaut
  # vm_machine = "q35" par défaut
  # vm_tablet_device = false par défaut

  # vm_os_type = "l26" par défaut

  # vm_agent_enabled = true par défaut

  source_vm_id = local.node_template_map[var.node_name_1]
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
  vlan_tag    = var.environnement == "poc" ? 0 : 150

  disks = [
    {
      disk_interface   = "scsi0"
      disk_size        = 15
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
  ipv4_cidr    = var.ipv4_cidr_bdd_adm
  ipv4_gateway = var.gateway_vlan150

  dns_domain  = "nuuk-medilab.lan"
  dns_servers = ["1.1.1.1", "8.8.8.8"] # Temporaire avant de mettre les IPs de nos DNS interne
}

module "bdd_adm_node2" {
  for_each = local.bdd_adm_node2
  source   = "git::https://github.com/cacti-lfs/terraform-module-proxmox.git//vm-clone?ref=main"

  providers = {
    proxmox = proxmox.provider_node2
  }

  node_name      = var.node_name_2
  vm_name        = "DEB-BDD-ADM-${each.key}"
  vm_id          = 1500 + tonumber(each.key)
  vm_description = "BDD ADM"
  vm_tags        = ["BDD-ADM", "vlan150"]
  # vm_bios = "seabios" par défaut
  # vm_machine = "q35" par défaut
  # vm_tablet_device = false par défaut

  # vm_os_type = "l26" par défaut

  # vm_agent_enabled = true par défaut

  source_vm_id = local.node_template_map[var.node_name_2]
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
  vlan_tag    = var.environnement == "poc" ? 0 : 150

  disks = [
    {
      disk_interface   = "scsi0"
      disk_size        = 15
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
  ipv4_cidr    = var.ipv4_cidr_bdd_adm
  ipv4_gateway = var.gateway_vlan150

  dns_domain  = "nuuk-medilab.lan"
  dns_servers = ["1.1.1.1", "8.8.8.8"] # Temporaire avant de mettre les IPs de nos DNS interne
}

module "bdd_mon_node1" {
  for_each = local.bdd_mon_node1
  source   = "git::https://github.com/cacti-lfs/terraform-module-proxmox.git//vm-clone?ref=main"

  providers = {
    proxmox = proxmox.provider_node1
  }

  node_name      = var.node_name_1
  vm_name        = "DEB-BDD-MON-${each.key}"
  vm_id          = 1600 + tonumber(each.key)
  vm_description = "BDD-MON"
  vm_tags        = ["BDD-MON", "vlan160"]
  # vm_bios = "seabios" par défaut
  # vm_machine = "q35" par défaut
  # vm_tablet_device = false par défaut

  # vm_os_type = "l26" par défaut

  # vm_agent_enabled = true par défaut

  source_vm_id = local.node_template_map[var.node_name_1]
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
  vlan_tag    = var.environnement == "poc" ? 0 : 160

  disks = [
    {
      disk_interface   = "scsi0"
      disk_size        = 15
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
  ipv4_cidr    = var.ipv4_cidr_bdd_mon
  ipv4_gateway = var.gateway_vlan160

  dns_domain  = "nuuk-medilab.lan"
  dns_servers = ["1.1.1.1", "8.8.8.8"] # Temporaire avant de mettre les IPs de nos DNS interne
}

module "bdd_mon_node2" {
  for_each = local.bdd_mon_node2
  source   = "git::https://github.com/cacti-lfs/terraform-module-proxmox.git//vm-clone?ref=main"

  providers = {
    proxmox = proxmox.provider_node2
  }

  node_name      = var.node_name_2
  vm_name        = "DEB-BDD-MON-${each.key}"
  vm_id          = 1600 + tonumber(each.key)
  vm_description = "BDD-MON"
  vm_tags        = ["BDD-MON", "vlan160"]
  # vm_bios = "seabios" par défaut
  # vm_machine = "q35" par défaut
  # vm_tablet_device = false par défaut

  # vm_os_type = "l26" par défaut

  # vm_agent_enabled = true par défaut

  source_vm_id = local.node_template_map[var.node_name_2]
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
  vlan_tag    = var.environnement == "poc" ? 0 : 160

  disks = [
    {
      disk_interface   = "scsi0"
      disk_size        = 15
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
  ipv4_cidr    = var.ipv4_cidr_bdd_mon
  ipv4_gateway = var.gateway_vlan160

  dns_domain  = "nuuk-medilab.lan"
  dns_servers = ["1.1.1.1", "8.8.8.8"] # Temporaire avant de mettre les IPs de nos DNS interne
}
