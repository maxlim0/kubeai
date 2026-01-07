variable "gitops_repo_url" {
    type    = string
    default = "https://github.com/maxlim0/kubeai.git"
}

variable "gitops_target_revision" {
    description = "branch/tag/sha"
    type        = string
    default     = "main" 
}

variable "gitops_root_path" {
    description = "path in repo to platform apps"
    type        = string
    default     = "apps/platform"
}