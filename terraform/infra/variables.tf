variable "do_token" {
    description = "DigitalOcean API token"
    type        = string
    sensitive   = true
}

variable "project_name" {
    description = "Project name"
    type        = string
    default     = "do-k8s"
}

variable "enviroument" {
    description = "ENV name"
    type        = string
    default     = "lab"
}

variable "region" {
    description = "DigitalOcean region"
    type        = string
    default     = "tor1"
}

variable "cluster_name" {
    description = "Cluster name if default will be project_name-enviroument"
    type        = string
    default     = null
}

variable "kubernetes_version" {
    description = "Kubernetes version"
    type        = string
    default     = null
}

variable "node_size" {
    description = "Node size"
    type        = string
    default     = "s-2vcpu-2gb"
}

variable "node_count" {
    description = "Node count"
    type        = number
    default     = 1
}

variable "auto_upgrade" {
  description = "Авто-апгрейд Kubernetes (для лабы обычно удобно)."
  type        = bool
  default     = true
}

variable "surge_upgrade" {
  description = "Surge upgrades (если поддерживается провайдером/ресурсом)."
  type        = bool
  default     = false
}

variable "tags" {
    description = "DO Tags"
    type        = map(string)
    default     = {
        owner = "max"}
}

