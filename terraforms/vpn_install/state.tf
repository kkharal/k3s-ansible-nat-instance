locals {
  backend = "${var.client}-${var.environment}"
}
terraform {
  backend "s3"{
    key = "vpn.tfstate"
    bucket = "${local.backend}-state"
  }
}
data "terraform_remote_state" "environment" {
  backend = "s3"
  config = {
    region = var.aws_region
    bucket = "${local.backend}-state"
    key    = "terraform.tfstate"
  }
}