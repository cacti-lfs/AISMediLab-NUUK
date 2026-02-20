terraform {
  cloud {
    organization = "nuuk"
    workspaces {
      tags = ["medilab"]
    }
  }
}