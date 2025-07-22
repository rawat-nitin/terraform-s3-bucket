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
    Environment = "dev"
    Owner       = "nitin"
    Project     = "terragrunt-s3-demo"
  }
}
