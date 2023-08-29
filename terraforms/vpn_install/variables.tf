variable "client" {
  description = "Name of client. In lower case, spaces replaced with '-'"
  type        = string
  # default     = "lccsender"
}

variable "environment" {
  description = "Environment Name"
  type        = string
  # default     = "dev"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  # default = "ap-southeast-1"
}