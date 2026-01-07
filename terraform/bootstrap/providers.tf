terraform {
    required_version = ">= 1.14.3"

    required_providers {

        kubernetes = {
            source  = "hashicorp/kubernetes"
            version = "3.0.1"
        }
    }
}

provider "kubernetes" {
  host                   = data.terraform_remote_state.infra.outputs.kubernetes_endpoint
  cluster_ca_certificate = base64decode(data.terraform_remote_state.infra.outputs.cluster_ca_certificate)
  token                  = data.terraform_remote_state.infra.outputs.kubernetes_token
}

