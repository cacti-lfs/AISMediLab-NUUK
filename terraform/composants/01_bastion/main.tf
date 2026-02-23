module "bastion" {
  for_each = local.bastion_vm
  source   = "git::https://github.com/cacti-lfs/terraform-module-proxmox.git//vm-clone?ref=main"

  node_name = each.value.node_name
  vm_name = "DEB-BAST-${each.key}"
  vm_id   = 400 + tonumber(each.key)
  vm_description = "Bastion"
  vm_tags = ["bastion", "vlan40"]
  # vm_bios = "seabios" par défaut
  # vm_machine = "q35" par défaut
  # vm_tablet_device = false par défaut

  # vm_os_type = "l26" par défaut

  # vm_agent_enabled = true par défaut

  source_vm_id  = local.node_template_map[each.value.node_name]
  full_clone    = false # false par défaut

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

  vnic_model = "virtio" # e1000 par défaut
  vnic_bridge = var.network_v1
  vlan_tag = 40

  disks = [
    {
      disk_interface = "scsi0"
      disk_size = 15
      disk_storage_id = var.datastore_id
      disk_type = "disk"
    }
  ]
  
  # ci_datastore_id = null par défaut
  # ci_meta_data_file_id = null par défaut
  # ci_network_data_file_id = null par défaut
  # ci_user_data_file_id = null par défaut
  # ci_vendor_data_file_id = null par défaut

  user_account_username = "cloudadm"
  user_account_ssh_public_keys = var.ssh_public_keys

  ipv4_address = each.value.ipv4_address
  ipv4_cidr         = "/28"
  ipv4_gateway      = var.gateway_vlan40

  dns_domain = "nuuk-medilab.lan"
  dns_servers = ["1.1.1.1", "8.8.8.8"] # Temporaire avant de mettre les IPs de nos DNS internes
}