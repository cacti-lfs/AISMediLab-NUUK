terraform {
  cloud {
    organization = "nuuk"
    workspaces {
      tags = ["medilab", "01-bastion"]
    }
  }
}