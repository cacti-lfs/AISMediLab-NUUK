# main.tf

# --- BASTION ---
locals {
    bastions = {
        "01" = "192.168.1.49"
        "02" = "192.168.1.50"
    }
}
module "bastions" {
    for_each = local.bastions
    source   = "./modules/bastion"

    vm_name      = "DEB-BAS-${each.key}"
    vm_id        = 400 + tonumber(each.key)
    target_node  = var.target_node
    template_id  = "9000"

    ipv4_address = each.value
    cidr_suffix  = "/24"
    gateway      = "192.168.1.1"

    network_bridge = "vmbr0"
}