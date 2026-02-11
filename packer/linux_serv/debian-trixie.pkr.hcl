packer {
  required_plugins {
    proxmox = {
      version = "=1.1.2"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}

source "proxmox-iso" "debian-trixie" {
    http_bind_address = "XX.XX.XX.XX" # A personnaliser avec l'IP de son poste
    http_port_min = 8539
    http_port_max = 8539
  # Connexion API
  proxmox_url              = var.proxmox_api_url
  username                 = var.proxmox_api_token_id
  token                    = var.proxmox_api_token_secret
  insecure_skip_tls_verify = true
  
  # Destination
  node                 = var.proxmox_node
  vm_id                = 9010
  vm_name              = var.vm_name
  template_description = "Template Debian Trixie créé par Packer le ${formatdate("YYYY-MM-DD", timestamp())}" # A perosonnaliser

  # Configuration VM
  cores                = 1
  memory               = 1024
  scsi_controller      = "virtio-scsi-pci" # A personnaliser
  
  network_adapters {
    model  = "virtio"
    bridge = "vmbr0"
  }

  disks {
    disk_size         = "10G"
    format            = "raw"
    storage_pool      = "TN-TN1"
    type              = "scsi"
  }

  # ISO
  iso_storage_pool = "local"
  iso_file         = "local:iso/SRV_DEB_13.3.0.iso" # A personnaliser avec le nom de l'ISO sur Proxmox
  unmount_iso      = true

  # SSH & Preseed
  ssh_username     = "cloudadm"
  ssh_password     = var.ssh_password
  ssh_timeout      = "20m"
  http_directory   = "."
  
  # Même boot_command que pour VirtualBox
    boot_command = [
        "<esc><wait>",
        "install <wait>",
        " netcfg/choose_interface=auto <wait>",
        " <wait10s>",
        " auto=true priority=critical preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg <wait>",
        " locale=fr_FR <wait>",
        " console-setup/ask_detect=false <wait>",
        " keyboard-configuration/xkb-keymap=fr(latin9) <wait>",
        " fb=false <wait>",
        " vga=788 -- <wait>",
        "<enter><wait>"
    ]
}

build {
  sources = ["source.proxmox-iso.debian-trixie"]

  provisioner "shell" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y cloud-init qemu-guest-agent",
      
      "sudo cloud-init clean",
      
      "sudo truncate -s 0 /etc/machine-id",
      
      "sudo systemctl enable qemu-guest-agent"

    ]
  }
}