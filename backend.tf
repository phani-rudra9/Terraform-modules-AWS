terraform {
  cloud {
    organization = "terraform-9"
    workspaces {
     tags = ["UAT", "STAGE", "PROD"]
    }
  }
}
