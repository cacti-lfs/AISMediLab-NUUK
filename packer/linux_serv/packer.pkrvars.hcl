proxmox_api_url          = "https://XX.XX.XX.XX:8006/api2/json" # A personnaliser
proxmox_api_token_id     = "terraform-prov@pve!terraform" # A personnaliser
proxmox_api_token_secret = "" # A personnaliser

proxmox_node = "" # A personnaliser par son nom de noeud
vm_name      = "" # A personnaliser par le nom de la VM
ssh_password = "throughtpolice123+" # Mot de passe temporaire de l'utilisateur

iso_url      = "https://cdimage.debian.org/cdimage/daily-builds/daily/arch-latest/amd64/iso-cd/debian-testing-amd64-netinst.iso" # A personnaliser par l'URL de l'ISO
iso_checksum = "8b7370e9a8139b36e9defd4f61eccb3e5e082780580d39b39e9034339e5f766ad0f64a50254ffa37d0d8ba6e76b74a12e13b9ae3e9c31d342f41e29985bf4934" # A personnaliser par le checksum de l'ISO