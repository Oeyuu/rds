terraform {
  backend "s3" {
    bucket = "teclify-sandbox2-143805577160-terraform-state"
    key    = "rds/terraform.tfstate"
    region = "eu-central-1"
  }
}
