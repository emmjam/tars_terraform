data "template_file" "jenkins_worker_task" {
  template = file(
    "${path.module}/templates/jenkins_worker_task.json.tmpl",
  )


  vars = {
    region        = var.region
    java_options  = var.jenkins_java_options
    image         = var.jenkins_worker_image
    log_group     = aws_cloudwatch_log_group.main.name
    stream_prefix = "${var.project}-jenkins_worker"
    name          = "jenkins_worker"
    memory_reservation = "2048"
  }
}
