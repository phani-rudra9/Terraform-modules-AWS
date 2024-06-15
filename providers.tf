provider "aws" {
  region     = var.region
  access_key = data.hcp_vault_secrets_app.aws_app.secrets["access_key"]
  secret_key = data.hcp_vault_secrets_app.aws_app.secrets["secret_key"]
}




terraform {
  required_providers {
    hcp = {
      source = "hashicorp/hcp"
      version = "0.91.0"
    }
  }
}

data "hcp_vault_secrets_app" "aws_app" {
  app_name = "demo"
}

provider "hcp" {
  client_id          = ""
  client_secret      = ""
}
