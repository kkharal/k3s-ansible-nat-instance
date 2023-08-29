locals {
  backend_name = "${var.client}-${var.environment}"
  name = "${var.client}-${var.environment}"
}
terraform {
  backend "s3"{
    key = "addons.tfstate"
    bucket = "${local.backend_name}-state"
  }
}
data "terraform_remote_state" "k3s" {
  backend = "s3"
  config = {
    region = var.aws_region
    bucket = "${local.backend_name}-state"
    key    = "terraform.tfstate"
  }
}
