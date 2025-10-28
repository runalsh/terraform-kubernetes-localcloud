terraform {
  required_version = ">= 1.6.0"

  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "3.1.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.38.0"
    }
  }
}
