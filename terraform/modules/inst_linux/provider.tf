terraform {
  required_providers {
    proxmox = {
      version = "0.94.0"
      source  = "bpg/proxmox"
    }
  }
}

# Le provider est passé par l'appelant (configuration au niveau parent)
# Cela permet l'utilisation de for_each et depends_on