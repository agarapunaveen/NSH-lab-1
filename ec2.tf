/*resource "aws_instance" "terraform-server" {
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type    = var.instance_type

  tags = {
    Name = "instance-1"
  }
} */

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = var.instance_type
  
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
