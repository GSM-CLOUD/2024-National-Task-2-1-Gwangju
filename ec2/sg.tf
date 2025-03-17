resource "aws_security_group" "instance_1_sg" {
  vpc_id = var.vpc_1_id
  description = "allow icmp"
  ingress = [{
    description = "allow icmp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = -1
    to_port = -1
    protocol = "icmp"
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false
  },
  {
    description = "allow https"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 443
    to_port = 443
    protocol = "tcp"
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false
  },
  {
    description = "allow ssh"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 22
    to_port = 22
    protocol = "tcp"
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false
  }]

  egress = [{
    description = "allow all"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    to_port = 0
    protocol = "-1"
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false
  }]


  tags = {
    "Name" = "${var.prefix}-instance-1-sg"
  }
}

resource "aws_security_group" "instance_2_sg" {
  vpc_id = var.vpc_2_id
  description = "allow icmp"
  ingress = [{
    description = "allow icmp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = -1
    to_port = -1
    protocol = "icmp"
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false
  },
  {
    description = "allow https"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 443
    to_port = 443
    protocol = "tcp"
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false
  },
  {
    description = "allow ssh"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 22
    to_port = 22
    protocol = "tcp"
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false
  }]

  egress = [{
    description = "allow all"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    to_port = 0
    protocol = "-1"
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false
  }]


  tags = {
    "Name" = "${var.prefix}-instance-2-sg"
  }
}

resource "aws_security_group" "instance_egress_sg" {
  vpc_id = var.vpc_egress_id
  description = "allow icmp"
  ingress = [{
    description = "allow icmp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = -1
    to_port = -1
    protocol = "icmp"
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false
  },
  {
    description = "allow https"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 443
    to_port = 443
    protocol = "tcp"
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false
  },
  {
    description = "allow ssh"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 22
    to_port = 22
    protocol = "tcp"
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false
  }]

  egress = [{
    description = "allow all"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    to_port = 0
    protocol = "-1"
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false
  }]


  tags = {
    "Name" = "${var.prefix}-instance-egress-sg"
  }
}