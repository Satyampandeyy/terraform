#creating ec2 instance
resource "aws_instance" "web" {
  ami                    = "${var.image_id}"
  instance_type          = "${var.instance_type}"
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls1.id}"]

  tags = {
    Name = "controller"
  }
  # Used to run script after instance creation
  user_data =file("${path.module}/script.sh")

#   user_data = <<EOF
# #!/bin/bash
# sudo apt-get update
# sudo apt-get install nginx -y
# sudo echo "Hi This is satyam!!" >/var/www/html/index.nginx-debian.html
# EOF
}


output "SecurityGroupDetails" {
  value = aws_security_group.allow_tls1.id
}



resource "aws_instance" "web1" {
  ami                    = "${var.image_id}"
  instance_type          = "${var.instance_type}"
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls1.id}"]

  tags = {
    Name = "server1"
  }
}
resource "aws_instance" "web2" {
  ami                    = "${var.image_id}"
  instance_type          = "${var.instance_type}"
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls1.id}"]

  tags = {
    Name = "server2"
  }
}