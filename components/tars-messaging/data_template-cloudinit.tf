# Create the cloud init template for the wildfly batch server
data "template_file" "messaging" {
  template = "${file("${path.module}/templates/messaging_setup.ps1.tmpl")}"

  # Set puppet factors
  vars {
    environment    = "${var.environment}"
    kms_key = "${data.terraform_remote_state.acc.hieradata_kms_key_id}"
    aws_account_id = "${var.aws_account_id}"
  }
}
