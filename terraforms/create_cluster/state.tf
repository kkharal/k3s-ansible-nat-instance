locals {
  backend= "${var.client}-${var.environment}"
}
terraform {
  backend "s3"{
    key = "k3s.tfstate"
    bucket = "${local.backend}-state"
  }
}
data "terraform_remote_state" "env" {
  backend = "s3"
  config = {
    region = var.aws_region
    bucket = "${local.backend}-state"
    key    = "terraform.tfstate"
  }
}

resource "aws_s3_bucket_object" "kubeconfig" {
  depends_on = [ local_file.ansible_inventory ]
  bucket = "${local.backend}-state"
  key    = "kubeconfig"
  source = "/tmp/kubeconfig-lcc"
}
