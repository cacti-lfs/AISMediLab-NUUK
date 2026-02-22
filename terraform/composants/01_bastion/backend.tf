terraform {
  backend "remote" {
    organization = "<env:TF_CLOUD_ORGANIZATION>"
    workspaces {
      name = "<env:TF_WORKSPACE>"
    }
  }
}