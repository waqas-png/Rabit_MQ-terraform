variable "aws_region" {
  description = "The AWS region to deploy the resources"
  type        = string
  default     = "us-west-2"
}

variable "deployment_mode" {
  description = "Deployment mode: single or cluster"
  type        = string
}

variable "instance_type" {
  description = "Instance type for RabbitMQ"
  type        = string
}

variable "multi_az" {
  description = "Deploy in multiple availability zones"
  type        = bool
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
}

variable "cpu_high_threshold" {
  description = "CPU utilization threshold to scale up"
  type        = number
}

variable "cpu_low_threshold" {
  description = "CPU utilization threshold to scale down"
  type        = number
}



variable "env" {
  description = "Environment: dev, pre-prod, or prod"
  type        = string
}
