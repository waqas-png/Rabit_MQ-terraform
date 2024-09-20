resource "aws_mq_configuration" "rabbitmq" {
  name        = var.configuration_name
  description = var.configuration_description
  engine_type = "RabbitMQ"
  engine_version = "3.13"
  data = <<DATA
   # Default RabbitMQ delivery acknowledgement timeout is 30 minutes in milliseconds
    consumer_timeout = 1800000 
    DATA
}

resource "aws_mq_broker" "rabbitmq" {
  count = var.deployment_mode == "ACTIVE_STANDBY_MULTI_AZ" && var.env == "prod" ? 3 : 1

  broker_name        = var.broker_name
  engine_type        = "RabbitMQ"
  engine_version     = "3.13"
  host_instance_type = var.instance_type
  deployment_mode    = var.deployment_mode

  auto_minor_version_upgrade = true
  publicly_accessible        = true

  configuration {
    id       = aws_mq_configuration.rabbitmq.id
    revision = aws_mq_configuration.rabbitmq.latest_revision
  }

  user {
    username = var.rabbitmq_username
    password = var.rabbitmq_password
  }

  

  tags = var.tags
}

resource "aws_mq_broker" "single_instance" {
  count = var.deployment_mode == "SINGLE_INSTANCE" && var.env != "prod" ? 1 : 0

  broker_name        = var.broker_name
  engine_type        = "RabbitMQ"
  engine_version     = "3.13"
  host_instance_type = var.instance_type
  deployment_mode    = var.deployment_mode

  auto_minor_version_upgrade = true
  publicly_accessible        = true

  configuration {
    id       = aws_mq_configuration.rabbitmq.id
    revision = aws_mq_configuration.rabbitmq.latest_revision
  }

  user {
    username = var.rabbitmq_username
    password = var.rabbitmq_password
  }

  
  tags = var.tags
}

