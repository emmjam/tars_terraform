resource "aws_mq_configuration" "tars-awsmq" {
  description    = var.aws_mq_config_description
  name           = var.aws_mq_config_name
  engine_type    = var.aws_mq_config_engine_type
  engine_version = var.aws_mq_config_engine_version
  data           = data.template_file.mq_configuration_tars_awsmq_data.rendered
}

