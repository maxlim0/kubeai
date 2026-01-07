resource "helm_release" "argocd" {
    name = "argocd"
    namespace = "argocd"
    chart = "argo-cd"
    repository = "https://argoproj.github.io/argo-helm"
    create_namespace = true
    version = "9.2.4"
    depends_on = [ module.k8s ]
}