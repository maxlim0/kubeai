variable "cluster_name" {
  description = "Имя Kubernetes кластера (DOKS)."
  type        = string
}

variable "region" {
  description = "Регион DigitalOcean (например fra1, ams3, nyc3)."
  type        = string
  default = "tor1"
}

variable "kubernetes_version" {
  description = "Версия Kubernetes (slug, например 1.30.6-do.0). Если null — берём latest_version."
  type        = string
  default     = null
}

variable "kubernetes_version_prefix" {
  description = "Опционально: префикс версии (например 1.29.) для выбора latest внутри minor. Используется только если kubernetes_version=null."
  type        = string
  default     = null
}

variable "auto_upgrade" {
  description = "Авто-апгрейд patch-версий в maintenance window."
  type        = bool
  default     = true
}

variable "surge_upgrade" {
  description = "Surge upgrades (увеличение мощности на время апгрейда)."
  type        = bool
  default     = true
}

variable "maintenance_policy_day" {
  description = "День maintenance window (monday..sunday или any). Применяется только при auto_upgrade=true и если задан вместе со start_time."
  type        = string
  default     = null
}

variable "maintenance_policy_start_time_utc" {
  description = "Время начала maintenance window в UTC в формате HH:MM (например 04:00). Применяется только при auto_upgrade=true и если задано вместе с day."
  type        = string
  default     = null
}

variable "node_pool_name" {
  description = "Имя default node pool."
  type        = string
  default     = "default-pool"
}

variable "node_size" {
  description = "Размер нод (slug), например s-2vcpu-4gb."
  type        = string
}

variable "node_count" {
  description = "Количество нод (используется когда node_auto_scale=false)."
  type        = number
  default     = 1

  validation {
    condition     = var.node_count >= 1
    error_message = "node_count должен быть >= 1."
  }
}

variable "node_auto_scale" {
  description = "Включить autoscaling для node pool."
  type        = bool
  default     = false
}

variable "node_min_nodes" {
  description = "Минимум нод при autoscaling (>=1)."
  type        = number
  default     = 1
}

variable "node_max_nodes" {
  description = "Максимум нод при autoscaling."
  type        = number
  default     = 3
}

variable "node_labels" {
  description = "Kubernetes labels для нод."
  type        = map(string)
  default     = {}
}


variable "tags" {
  description = "Теги в виде map, будут преобразованы в список строк 'k=v' для DigitalOcean tags."
  type        = map(string)
  default     = {}
}

variable "destroy_all_associated_resources" {
  description = "Если true — при destroy кластера удалит связанные ресурсы, созданные через Kubernetes API (LB, volumes, snapshots). Осторожно."
  type        = bool
  default     = true
}

variable "gpu_pool_enabled" {
  type        = bool
  default     = false
}

variable "gpu_node_pool_name" {
  type        = string
  default     = "gpu-pool"
}

variable "gpu_node_size" {
  type        = string
  default     = null
}

variable "gpu_node_count" {
  type    = number
  default = 0
}

variable "gpu_node_labels" {
  type    = map(string)
  default = {} 
} 

variable "gpu_node_taints" {
  type = list(object({
    key    = string
    value  = string
    effect = string
  }))
  default = []
  
}

