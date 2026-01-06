terraform {
    required_version = ">= 1.14.3"

    required_providers {
        digitalocean = {
            source  = "digitalocean/digitalocean"
            version = ">= 2.72.0"
        }

        kubernetes = {
            source  = "hashicorp/kubernetes"
            version = "3.0.1"
        }

        helm = {
            source  = "hashicorp/helm"
            version = "3.1.1"
        }

        local = {
            source  = "hashicorp/local"
            version = "2.6.1"
        }

        time = {
            source  = "hashicorp/time"
            version = "0.13.1"
        }
    }
}

provider "digitalocean" {
    token = var.do_token
}

resource "local_file" "kubeconfig" {
    filename = "${path.root}/.generated/kubeconfig.yaml"
    content = module.k8s.kubeconfig_raw
    file_permission = "0600"
}

resource "time_sleep" "wait_cluster" {
  depends_on = [ local_file.kubeconfig ]
  create_duration = "300s"
}

provider "kubernetes" {
  config_path = local_file.kubeconfig.filename
}

provider "helm" {
  kubernetes = {
    config_path = local_file.kubeconfig.filename
  }
}
