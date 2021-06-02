resource "aws_eip" "oraclexe" {
   instance = aws_instance.oraclexe.id
   vpc   = true
}
