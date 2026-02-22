module "bastion" {
  for_each = local.bastion_vm
  source   = "git::https://github.com/cacti-lfs/AISMediLab-NUUK.git//terraform/modules/inst_linux?ref=feature"

  vm_name = "DEB-BAST-${each.key}"
  vm_id   = 400 + tonumber(each.key)

  node_name = each.value.node_name

  template_id  = local.node_template_map[each.value.node_name]
  datastore_id = var.datastore_id

  ipv4_address = each.value.ipv4_address
  cidr         = "/28"
  gateway      = var.gateway_vlan40
  vlan_id      = each.value.vlan_id

  network_bridge = var.network_v1

  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.cpu_cores
  memory          = var.memory
  disk_size       = var.disk_size
}