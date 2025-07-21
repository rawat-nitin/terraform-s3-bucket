# Beware: Root level terragrunt
locals {
  region = "ap-northeast-1"
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "my-terraform-state-bucket"
    key            = "${path_relative_to_include()}/terraform.tfstate}"
    region         = local.region
    dynamodb_table = "terragrunt-locks"
    encrypt        = true
  }
}