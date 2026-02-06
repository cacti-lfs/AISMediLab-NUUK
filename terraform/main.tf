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
    source   = "./modules/inst_linux"

    vm_name      = "DEB-BAS-${each.key}"
    vm_id        = 400 + tonumber(each.key)
    
    # Ici, tu DOIS utiliser le nom défini dans variables.tf du module
    node_name  = var.node_name
    
    template_id  = 9000
    datastore_id = "TN-TN1"

    ipv4_address = each.value
    cidr         = "/24"
    gateway      = "192.168.1.1"

    network_bridge = "vmbr0"
}