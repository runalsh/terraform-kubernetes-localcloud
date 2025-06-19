terraform {
  required_version = ">= 1.6.0"

  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "3.0.1"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.37.0"
    }
  }
}
