resource "aws_instance" "terraform-server" {
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type    = var.instance_type

  tags = {
    Name = "instance-1"
  }
}
