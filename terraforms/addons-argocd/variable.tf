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

variable "enable_dns_hostname" {
  description = "VPC enable DNS hostname"
  type        = bool
  default     = true
}

variable "subnet_cidr_bits" {
  description = "The number of subnet bits for the CIDR. For example, specifying a value 8 for this parameter will create a CIDR with a mask of /24."
  type        = number
  default     = 8
}

variable "helm_external_dns_version" {
  description = "helm external dns version"
}

variable "external_dns_namespace" {
  description = "Kubernetes namespace to install external dns into"
  type        = string
  default     = "external-dns"
}
variable "ingress_ext_name" {
  description = "ingress ext name"
  type = string
}

###############################################
# Lets Encrypt

variable "letsencrypt_email" {
  description = "ingress ext name"
  type = string
}

variable "letsencrypt_server" {
  description = "production le server or staging"
  type        = string
  default     = "production"
}

variable "cert_man_namespace" {
  description = "Kubernetes namespace to install certman into"
  type        = string
  default     = "cert-manager"
}

variable "cert_man_letsencrypt_cluster_issuer_name" {
  description = "cluster issuer name for letsencrypt"
  type        = string
  default     = "letsencrypt"
}

variable "cert_man_vault_cluster_issuer_name" {
  description = "cluster issuer name for vault"
  type        = string
  default     = "vault-issuer-root"
}

variable "int_wildcard_cert_sec_name" {
  description = "letsenc wildcard sec for operations tls endpoints"
  type        = string
  default     = "int-ops-wildcard-tls"
}

variable "public_subdomain" {
  description = "public_subdomain"
  type        = string
}

variable "helm_certmanager_version" {
  description = "helm_certmanager_version"
  type        = string
  default = "1.6.1"
}

variable "helm_nginx_version" {
  description = "Nginx version used by the ingress controller"
  type = string 
  default = "4.6.1"
}
