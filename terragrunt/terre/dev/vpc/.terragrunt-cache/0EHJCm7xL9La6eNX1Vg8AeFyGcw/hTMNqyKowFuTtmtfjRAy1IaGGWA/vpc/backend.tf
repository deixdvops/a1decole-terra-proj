# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket         = "500-dev-deix-tf-state"
    dynamodb_table = "500-dev-deix-tf-state-lock"
    encrypt        = true
    key            = "vpc/terraform.tfstate"
    region         = "us-east-1"
  }
}
