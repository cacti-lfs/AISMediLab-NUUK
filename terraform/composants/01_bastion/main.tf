module "bastion" {
  for_each = local.bastion_vm
  source   = "../../modules/inst_linux"

  vm_name = "DEB-BAST-${each.key}"
  vm_id   = 400 + tonumber(each.key)

  node_name = each.value.node_name

  template_id  = local.node_template_map[each.value.node_name]
  datastore_id = var.datastore_id

  ipv4_address = each.value.ipv4_address
  cidr         = "/28"
  gateway      = local.vlan_gateway_map[tostring(each.value.vlan_id)]
  vlan_id      = each.value.vlan_id

  network_bridge = local.vlan_bridge_map[tostring(each.value.vlan_id)]

  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.cpu_cores
  memory          = var.memory
  disk_size       = var.disk_size
}