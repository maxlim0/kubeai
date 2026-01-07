output "cluster_id" {
  description = "ID кластера."
  value       = digitalocean_kubernetes_cluster.this.id
}

output "cluster_name" {
  description = "Имя кластера."
  value       = digitalocean_kubernetes_cluster.this.name
}

output "kubernetes_endpoint" {
  description = "API endpoint Kubernetes."
  value       = digitalocean_kubernetes_cluster.this.endpoint
}


output "kubeconfig_raw" {
  description = "Raw kubeconfig (YAML). Sensitive."
  value       = digitalocean_kubernetes_cluster.this.kube_config[0].raw_config
  sensitive   = true
}

output "kubernetes_token" {
  description = "Token для доступа. Sensitive."
  value       = digitalocean_kubernetes_cluster.this.kube_config[0].token
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "CA certificate (base64). Sensitive."
  value       = digitalocean_kubernetes_cluster.this.kube_config[0].cluster_ca_certificate
  sensitive   = true
}

output "node_pool_id" {
  description = "ID default node pool."
  value       = digitalocean_kubernetes_cluster.this.node_pool[0].id
}

output "gpu_node_pool_id" {
  value = var.gpu_pool_enabled ? digitalocean_kubernetes_node_pool.gpu[0].id : null
}

output "gpu_actual_node_count" {
  value = var.gpu_pool_enabled ? digitalocean_kubernetes_node_pool.gpu[0].node_count : null
}