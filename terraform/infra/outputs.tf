output "cluster_id" {
  value       = module.k8s.cluster_id
}

output "kubernetes_endpoint" {
  value       = module.k8s.kubernetes_endpoint
  description = "Kubernetes API endpoint."
}

output "kubeconfig_raw" {
  value       = module.k8s.kubeconfig_raw
  description = "Raw kubeconfig (YAML)."
  sensitive   = true
}

output "kubernetes_token" {
  value       = module.k8s.kubernetes_token
  sensitive   = true
}

output "cluster_ca_certificate" {
  value = module.k8s.cluster_ca_certificate
  sensitive = true
}
