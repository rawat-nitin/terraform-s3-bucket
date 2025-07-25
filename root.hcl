# Beware: Root level terragrunt
# terraform-s3-bucket/root.hcl
locals {
  region = "ap-northeast-1"
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "my-terraform-state-bucket-202507212138"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.region
    dynamodb_table = "terragrunt-locks"
    encrypt        = true
  }
}