resource "aws_key_pair" "deployer" {
  key_name   = "deployer"
  public_key = var.deployer_pub_key
}

