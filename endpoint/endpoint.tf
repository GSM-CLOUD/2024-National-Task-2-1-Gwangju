resource "aws_vpc_endpoint" "ssm_vpc1" {
  vpc_id = var.vpc_1_id
  service_name = "com.amazonaws.${var.region}.ssm"
  vpc_endpoint_type = "Interface"
  subnet_ids = var.vpc_1_private_subnets
  security_group_ids = [var.vpc_1_sg_id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ssm_ec2_vpc1" {
  vpc_id = var.vpc_1_id
  service_name = "com.amazonaws.${var.region}.ec2"
  vpc_endpoint_type = "Interface"
  subnet_ids = var.vpc_1_private_subnets
  security_group_ids = [var.vpc_1_sg_id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ssm_messages_vpc1" {
  vpc_id = var.vpc_1_id
  service_name = "com.amazonaws.${var.region}.ssmmessages"
  vpc_endpoint_type = "Interface"
  subnet_ids = var.vpc_1_private_subnets
  security_group_ids = [var.vpc_1_sg_id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ec2_messages_vpc1" {
  vpc_id = var.vpc_1_id
  service_name = "com.amazonaws.${var.region}.ec2messages"
  vpc_endpoint_type = "Interface"
  subnet_ids = var.vpc_1_private_subnets
  security_group_ids = [var.vpc_1_sg_id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ssm_vpc2" {
  vpc_id = var.vpc_2_id
  service_name = "com.amazonaws.${var.region}.ssm"
  vpc_endpoint_type = "Interface"
  subnet_ids = var.vpc_2_private_subnets
  security_group_ids = [var.vpc_2_sg_id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ssm_ec2_vpc2" {
  vpc_id = var.vpc_2_id
  service_name = "com.amazonaws.${var.region}.ec2"
  vpc_endpoint_type = "Interface"
  subnet_ids = var.vpc_2_private_subnets
  security_group_ids = [var.vpc_2_sg_id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ssm_messages_vpc2" {
  vpc_id = var.vpc_2_id
  service_name = "com.amazonaws.${var.region}.ssmmessages"
  vpc_endpoint_type = "Interface"
  subnet_ids = var.vpc_2_private_subnets
  security_group_ids = [var.vpc_2_sg_id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ec2_messages_vpc2" {
  vpc_id = var.vpc_2_id
  service_name = "com.amazonaws.${var.region}.ec2messages"
  vpc_endpoint_type = "Interface"
  subnet_ids = var.vpc_2_private_subnets
  security_group_ids = [var.vpc_2_sg_id]
  private_dns_enabled = true
}