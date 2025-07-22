# Beware: Root level terragrunt
# terraform-s3-bucket/root.hcl
locals {
  region = "ap-northeast-1"
}

remote_state {
  backend = "s3"
  # Terragrunt-only: ephemeral inputs are excluded from the saved plan
  # Do not persist or rely on remote state, Terragrunt expects a normal working state and may behave
  ephemeral = true
  config = {
    bucket         = "my-terraform-state-bucket-202507212138"
    key            = "${path_relative_to_include()}/terraform.tfstate}"
    region         = local.region
    dynamodb_table = "terragrunt-locks"
    encrypt        = true
  }
}