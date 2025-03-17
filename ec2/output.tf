output "vpc_1_sg_id" {
  value = aws_security_group.instance_1_sg.id
}

output "vpc_2_sg_id" {
  value = aws_security_group.instance_2_sg.id
}