# infrastructure/envs/dev/s3-bucket/terragrunt.hcl
include {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../../modules/s3-bucket"
}

inputs = {
  bucket_name        = "my-dev-app-bucket"
  versioning_enabled = true
  tags = {
    Enviornment = "dev"
    Owner       = "nitin"
    Project     = "terragrunt-s3-demo"
  }
  # Terragrunt-only: ephemeral inputs are excluded from the saved plan
  ephemeral = true
}