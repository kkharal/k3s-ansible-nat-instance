locals {
  backend     = "${var.client}-${var.environment}"
}
terraform {
  backend "s3"{
    key = "terraform.tfstate"
    bucket = "${local.backend}-state"
  }
}