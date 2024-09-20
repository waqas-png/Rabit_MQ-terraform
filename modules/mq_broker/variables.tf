variable "deployment_mode" {
  description = "Deployment mode: single or cluster"
  type        = string
  default     = "single"
}

variable "instance_type" {
  description = "Instance type for RabbitMQ"
  type        = string
  default     = "mq.m5.large"
}

variable "multi_az" {
  description = "Deploy in multiple availability zones"
  type        = bool
  default     = false
}

variable "broker_name" {
  description = "The name of the RabbitMQ broker"
  type        = string
}

variable "rabbitmq_username" {
  description = "The username for RabbitMQ"
  type        = string
}

variable "rabbitmq_password" {
  description = "The password for RabbitMQ"
  type        = string
}

variable "tags" {
  description = "Tags for the RabbitMQ broker"
  type        = map(string)
  default     = {}
}

variable "configuration_name" {
  description = "The name of the RabbitMQ configuration"
  type        = string
}

variable "configuration_description" {
  description = "Description of the RabbitMQ configuration"
  type        = string
}

variable "virtual_hosts" {
  description = "List of virtual hosts for multi-tenancy"
  type        = list(string)
  default     = []
}

variable "cpu_high_threshold" {
  description = "CPU utilization threshold to scale up"
  type        = number
  default     = 80
}

variable "cpu_low_threshold" {
  description = "CPU utilization threshold to scale down"
  type        = number
  default     = 20
}

variable "enable_audit_logs" {
  description = "Enable audit logs for the RabbitMQ broker"
  type        = bool
  default     = false
}

variable "enable_general_logs" {
  description = "Enable general logs for the RabbitMQ broker"
  type        = bool
  default     = true
}

variable "env" {
  description = "Environment: dev, pre-prod, or prod"
  type        = string
}
