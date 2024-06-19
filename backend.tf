terraform {
  cloud {
    organization = "terraform-9"
    workspaces {
     prefix = "app-"
    }
  }
}
