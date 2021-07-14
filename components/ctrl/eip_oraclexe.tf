resource "aws_eip" "oraclexe" {
   count = var.account_environment != "mgmt" ? 1 : 0
   instance = aws_instance.oraclexe[count.index].id
   vpc   = true
}
