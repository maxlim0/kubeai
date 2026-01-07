locals {
  tags_list = [for k, v in var.tags : "${k}:${v}"]
}

data "digitalocean_kubernetes_versions" "this" {
  count = var.kubernetes_version == null ? 1 : 0
  version_prefix = var.kubernetes_version_prefix
}

resource "digitalocean_kubernetes_cluster" "this" {
    name    = var.cluster_name
    region  = var.region
    version = var.kubernetes_version == null ? data.digitalocean_kubernetes_versions.this[0].latest_version : var.kubernetes_version
    tags    = local.tags_list

    auto_upgrade = var.auto_upgrade
    surge_upgrade = var.surge_upgrade

    node_pool {
      name = var.node_pool_name
      size = var.node_size

      node_count = var.node_count
      auto_scale = var.node_auto_scale

      labels = var.node_labels
      tags = local.tags_list
    }

    destroy_all_associated_resources = var.destroy_all_associated_resources

}

resource "digitalocean_kubernetes_node_pool" "gpu" {
  count = var.gpu_pool_enabled ? 1 : 0
  cluster_id = digitalocean_kubernetes_cluster.this.id

  name       = var.gpu_node_pool_name
  size       = var.gpu_node_size
  node_count = var.gpu_node_count

  auto_scale = false

  labels = var.gpu_node_labels
  tags = local.tags_list

  dynamic "taint" {
    for_each = var.gpu_node_taints
    content {
      key = taint.value.key
      value = taint.value.value
      effect = taint.value.effect
    }
    
  }
}