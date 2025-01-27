resource "aws_instance" "terraform-server" {
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type    = lookup(var.instance_type,terraform.workspace,"t2.micro")

  tags = {
    Name = "instance-1"
  }
}
