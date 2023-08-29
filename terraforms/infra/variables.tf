variable "TWOwner" {
  description = "ThitsaWorks Owner '-'"
  type        = string
  # default     = "lccsender"
}

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
  description = "AWS region to create resources"
  type        = string
  # default     = "ap-southeast-1"
}

variable "vpn_instance_size" {
  description = "size of vpn server"
  type = string
  # default = "t2.micro"
}

variable "nat_instance_size" {
  description = "size of vpn server"
  type = string
  # default = "t2.micro"
}

variable "master_size" {
  description=  "instance size of master node"
  type = string
  # default = "t2.medium"
}

variable "worker_size" {
  description = "instance size of worker node"
  type = string
  # default = "t2.small"
}

variable "master_count" {
  description = "count of master node"
  type = number
  # default = 1
}

variable "worker_count" {
  description = "count of worker node"
  type = number
  # default = 2
}

variable "vpn_count" {
  description = "count of vpn server"
  type = number
  # default = 1
}

variable "nat_count" {
  description = "count of nat instance"
  type = number
  # default = 1
}

variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  # default     = "10.0.0.0/16"
}

variable "k3s_enable_dns_hostname" {
  description = "use dns hostname"
  type = bool
  # default = true
}

variable "k3s_enable_dns_support" {
  description = "use dns support"
  type = bool
  # default = true
}

variable "public_subnets_cidr" {
  description = "Public Subnet CIDR Block"
  type        = list(string)
  # default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "private_subnets_cidr_blocks" { 
  description = "Private Subnet CIDR Block"
  type        = list(string)
  # default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "availability_zones" {
  description = "Subnet Available Zone"
  type        = list(string)
  # default     = ["ap-southeast-1a", "ap-southeast-1c", "ap-southeast-1b"]
}

variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateway for VPC"
  type        = bool
  default     = true
}

variable "public_key_path" {
  description = "Public Key Path"
  default     = "../../scripts/id_rsa.pub"
}

variable "private_key_path" {
  description = "Public Key Path"
  default     = "../../scripts/private-key"
}


variable "ami" {
  description = "Ubuntu 22.04"
  default     = "ami-0df7a207adb9748c7"
}

variable "nat_instance" {
  description = "amzn-ami-vpc-nat"
  default     = "ami-0d20e3666350e2d67"
}

# variable "iac_group_name" {
#   type        = string
#   description = "iac group name"
#   default     = "admin"
# }
