terraform {
  backend "s3" {
    bucket = "test-bucket-00006"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}