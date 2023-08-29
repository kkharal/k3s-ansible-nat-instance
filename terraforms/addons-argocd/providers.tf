terraform {
  required_providers {
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

provider "kubernetes" {
  config_path    = "/tmp/kubeconfig-lcc"
  # config_context = "my-context"
}

provider "helm" {
  kubernetes {
    config_path    = "/tmp/kubeconfig-lcc"
  }
}

provider "kubectl" {
  config_path    = "/tmp/kubeconfig-lcc"
}

