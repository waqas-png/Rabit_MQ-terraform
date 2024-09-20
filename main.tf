provider "aws" {
  region = var.aws_region
}

module "mq_broker" {
  source = "./modules/mq_broker"

  deployment_mode           = var.deployment_mode
  instance_type             = var.instance_type
  multi_az                  = var.multi_az
  broker_name               = var.broker_name
  rabbitmq_username         = var.rabbitmq_username
  rabbitmq_password         = var.rabbitmq_password
  tags                      = var.tags
  configuration_name        = var.configuration_name
  configuration_description = var.configuration_description
  virtual_hosts             = var.virtual_hosts
  cpu_high_threshold        = var.cpu_high_threshold
  cpu_low_threshold         = var.cpu_low_threshold
  
  env                       = var.env
}


