terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.34"
    }
  }
}


provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment     = "${var.environment}"
      Client          = "${var.client}"
      TWOwner         = "${var.TWOwner}"

    }
  }
  
}

locals {
  name = "${var.client}-${var.environment}"
}

