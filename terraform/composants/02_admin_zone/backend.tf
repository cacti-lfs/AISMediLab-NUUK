terraform {
  cloud {
    organization = "nuuk"
    workspaces {
      tags = ["medilab", "02-core-infra"]
    }
  }
}