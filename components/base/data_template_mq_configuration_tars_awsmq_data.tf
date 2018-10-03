data "template_file" "mq_configuration_tars_awsmq_data" {
  template = "${file("${path.module}/templates/mq_configuration_tars_awsmq_data.xml.tmpl")}"

  vars = {}
}
