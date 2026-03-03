# locals.tf
locals {
  node_template_map = {
    (var.node_name_1) = var.template_id_node1
    (var.node_name_1) = var.template_id_node2
  }

  bdd_web_vm = {
    "01" = {
      ipv4_address = var.ip_bdd_web_01
      node_name = var.node_name_1
    }
    "02" = {
      ipv4_address = var.ip_bdd_web_02
      node_name = var.node_name_2
    }
    "03" = {
      ipv4_address = var.ip_bdd_web_03
      node_name = var.node_name_2
    }
  }

  bdd_adm_vm = {
    "01" = {
      ipv4_address = var.ip_bdd_adm_01
      node_name = var.node_name_1
    }
    "02" = {
      ipv4_address = var.ip_bdd_adm_02
      node_name = var.node_name_2
    }
    "03" = {
      ipv4_address = var.ip_bdd_adm_03
      node_name = var.node_name_1
    }
  }

    bdd_mon_vm = {
    "01" = {
      ipv4_address = var.ip_bdd_mon_01
      node_name = var.node_name_1
    }
    "02" = {
      ipv4_address = var.ip_bdd_mon_02
      node_name = var.node_name_2
    }
    "03" = {
      ipv4_address = var.ip_bdd_mon_03
      node_name = var.node_name_2
    }
  }
}

locals {
  bdd_web_node1 = {
    for k, v in local.local.bdd_web_vm :
    k => v if v.var.node_name == var.var.node_name_1
  }
  bdd_web_node2 = {
    for k, v in local.local.bdd_web_vm :
    k => v if v.var.node_name == var.var.node_name_2
  }
  bdd_adm_node1 = {
    for k, v in local.local.bdd_adm_vm :
    k => v if v.var.node_name == var.var.node_name_1
  }
  bdd_adm_node2 = {
    for k, v in local.local.bdd_adm_vm :
    k => v if v.var.node_name == var.var.node_name_2
  }
  bdd_mon_node1 = {
    for k, v in local.local.bdd_mon_vm :
    k => v if v.var.node_name == var.var.node_name_1
  }
  bdd_mon_node2 = {
    for k, v in local.local.bdd_mon_vm :
    k => v if v.var.node_name == var.var.node_name_2
  }
}