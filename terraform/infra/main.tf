locals {
    effective_cluster_name = coalesce(
        var.cluster_name,
        "${var.project_name}-${var.enviroument}"
    )

    common_tags = merge(
        {
            env     = var.enviroument,
            project = var.project_name
        },
        var.tags
    )
}

module "k8s" {
    source = "./modules/do_k8s_cluster"

    cluster_name = local.effective_cluster_name
    region       = var.region
    kubernetes_version = var.kubernetes_version

    node_size = var.node_size
    node_count = var.node_count

    auto_upgrade = var.auto_upgrade
    surge_upgrade = var.surge_upgrade

    tags = local.common_tags

    gpu_pool_enabled = var.gpu_pool_enabled
    gpu_node_pool_name = var.gpu_node_pool_name
    gpu_node_size = var.gpu_node_size
    gpu_node_count = 0

    gpu_node_labels = {
        workload = "gpu"
    }

    gpu_node_taints = [
        {
         key = "nvidia.com/gpu",
         value = "true",
         effect = "NoSchedule"
        }
    ]

}