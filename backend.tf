terraform {
  cloud {
    organization = "terraform-9"

    workspaces {
      name = "demo-new"
    }
  }
}