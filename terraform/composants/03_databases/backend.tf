terraform {
  cloud {
    organization = "nuuk"
    workspaces {
      tags = ["medilab", "03-databases"]
    }
  }
}