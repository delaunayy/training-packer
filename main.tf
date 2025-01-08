provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "yde_webserver" {
  ami             = var.ami_id
  instance_type   = "t2.micro"
  security_groups = ["allow_http"]
  tags = {
    Name = "yde my http server"
  }
  associate_public_ip_address = true
}
output "instance_id" {
  value = aws_instance.yde_webserver.id
}
output "public_ip" {
  value = aws_instance.yde_webserver.public_ip
}
variable "ami_id" {
  type = string
}
