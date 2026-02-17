terraform {
  cloud {
    organization = "nuuk"
    workspaces {
      name = "nuuk-medilab"
    }
  }
}