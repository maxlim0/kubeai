resource "kubernetes_manifest" "root_app" {
    manifest = {
        apiVersion = "argoproj.io/v1alpha1"
        kind = "Application"
        metadata = {
            name      = "root-app"
            namespace = "argocd"
        }
        spec = {
            project = "default"

            source = {
                repoURL = var.gitops_repo_url
                targetRevision = var.gitops_target_revision
                path = var.gitops_root_path
                directory = {
                    recurse = true
                }
            }
            destination = {
                server = "https://kubernetes.default.svc"
                namespace = "argocd"
            }
            syncPolicy = {
                automated = {
                    prune = true
                    selfHeal = true
                }
                syncOptions = [
                    "CreateNamespace=true",
                    "SkipDryRunOnMissingResource=true"
                ]
            }
        }
    }
}
