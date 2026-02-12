packer {
  required_plugins {
    proxmox = {
      version = "=1.1.2"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}

source "proxmox-iso" "debian-trixie" {
    http_bind_address = "192.168.33.12" # A personnaliser avec l'IP de son poste
    http_port_min = 8539
    http_port_max = 8539
  # Connexion API
  proxmox_url              = var.proxmox_api_url
  username                 = var.proxmox_api_token_id
  token                    = var.proxmox_api_token_secret
  insecure_skip_tls_verify = true
  
  # Destination
  node                 = var.proxmox_node
  vm_id                = 9000
  vm_name              = var.vm_name
  template_description = "Template Debian 13.3.0 créé par Packer le ${formatdate("YYYY-MM-DD", timestamp())}" # A perosonnaliser

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
  iso_storage_pool = "TN-TN1"
  iso_file         = "TN-TN1:iso/SRV_DEB_13.3.0.iso" # A personnaliser avec le nom de l'ISO sur Proxmox
  unmount_iso      = true

  # SSH & Preseed
  ssh_username     = "cloudadm"
  ssh_password     = var.ssh_password
  ssh_timeout      = "20m"
  http_directory   = "."
  
  # Même boot_command que pour VirtualBox
    boot_command = [
      "<esc><wait>",
      "install ",
      " auto=true priority=critical ",
      " netcfg/disable_autoconfig=true ",
      " netcfg/choose_interface=auto ",
      " netcfg/get_ipaddress=192.168.32.137 ",
      " netcfg/get_netmask=255.255.255.0 ",
      " netcfg/get_gateway=192.168.32.190 ",
      " netcfg/get_nameservers=1.1.1.1 ",
      " netcfg/confirm_static=true ",
      " preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg ",
      " locale=fr_FR ",
      " console-setup/ask_detect=false ",
      " keyboard-configuration/xkb-keymap=fr(latin9) ",
      " fb=false ",
      " vga=788 -- ",
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

      "sudo ln -sf /etc/machine-id /var/lib/dbus/machine-id",
      
      "sudo systemctl enable qemu-guest-agent",

      "apt clean"

    ]
  }
}