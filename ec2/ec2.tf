resource "aws_instance" "instance_1" {
  ami = var.aws_ami
  instance_type = "t3.small"

  subnet_id = var.vpc_1_subnets[0]

  vpc_security_group_ids = [aws_security_group.instance_1_sg.id]
  key_name = aws_key_pair.ec2-key-pair.key_name
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name

  tags = {
    "Name" = "${var.prefix}-VPC1-Instance"
  }
}

resource "aws_instance" "instance_2" {
  ami = var.aws_ami
  instance_type = "t3.small"

  subnet_id = var.vpc_2_subnets[0]
  vpc_security_group_ids = [aws_security_group.instance_2_sg.id]
  key_name = aws_key_pair.ec2-key-pair.key_name
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name

  tags = {
    "Name" = "${var.prefix}-VPC2-Instance"
  }

  depends_on = [ aws_instance.instance_1 ]
}

resource "aws_instance" "instance_egress" {
  ami = var.aws_ami
  instance_type = "t3.small"

  subnet_id = var.vpc_egress_subnets[0]
  vpc_security_group_ids = [aws_security_group.instance_egress_sg.id]
  key_name = aws_key_pair.ec2-key-pair.key_name
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name

  tags = {
    "Name" = "${var.prefix}-EgreessVPC-Instance"
  }

  depends_on = [ aws_instance.instance_2 ]
}