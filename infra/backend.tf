terraform {
  backend "s3" {
    bucket = "fiapx-statefile-bucket"
    key    = "infra/terraform.tfstate"
    region = "us-east-1"
  }
}