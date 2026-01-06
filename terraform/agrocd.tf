resource "helm_release" "agrocd" {
    depends_on = [ time_sleep.wait_cluster ]

    name = "agrocd"
    namespace = "agrocd"
    chart = "agrocd"
    repository = "https://argoproj.github.io/argo-helm"
    create_namespace = true
    version = "9.2.4"
}