output "vpc_id" {
  value = aws_instance.server.private_ip
}
