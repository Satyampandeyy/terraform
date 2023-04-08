#creating key pair in aws
resource "aws_key_pair" "my_key" {
  key_name   = "satyam-tf-key-from-tf"
  public_key = file("${path.module}/id_rsa.pub")
}

output "keyName" {
  value = aws_key_pair.my_key.public_key
}