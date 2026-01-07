terraform {
    required_version = ">= 1.14.3"

    required_providers {
        digitalocean = {
            source  = "digitalocean/digitalocean"
            version = ">= 2.72.0"
        }

        helm = {
            source  = "hashicorp/helm"
            version = "3.1.1"
        }
    }
}

provider "digitalocean" {
    token = var.do_token
}

provider "helm" {
    kubernetes = {
        host                   = module.k8s.kubernetes_endpoint
        cluster_ca_certificate = base64decode(module.k8s.cluster_ca_certificate)
        token                  = module.k8s.kubernetes_token
    }
}