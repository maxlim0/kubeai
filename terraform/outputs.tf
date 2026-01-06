output "cluster_id" {
  value       = module.k8s.cluster_id
  description = "ID созданного DOKS кластера."
}

output "endpoint" {
  value       = module.k8s.endpoint
  description = "Kubernetes API endpoint."
}

output "kubeconfig_raw" {
  value       = module.k8s.kubeconfig_raw
  description = "Raw kubeconfig (YAML)."
  sensitive   = true
}
