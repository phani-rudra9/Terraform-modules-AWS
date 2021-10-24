provider "aws" {
  region     = var.region
  access_key = $access_terra_key
  secret_key = $secret_terra_key
}
