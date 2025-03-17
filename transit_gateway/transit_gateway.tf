resource "aws_ec2_transit_gateway" "transit_gateway" {
  amazon_side_asn = 64512
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_1_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id = var.vpc_1_id
  subnet_ids = var.vpc_1_subnets
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_2_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id = var.vpc_2_id
  subnet_ids = var.vpc_2_subnets
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_egress_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id = var.vpc_egress_id
  subnet_ids = var.vpc_egress_subnets
}

resource "aws_ec2_transit_gateway_route_table" "default_route_table" {
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "vpc_1_propagation" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.default_route_table.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.vpc_1_attachment.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "vpc_2_propagation" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.default_route_table.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.vpc_2_attachment.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "vpc_egress_propagation" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.default_route_table.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.vpc_egress_attachment.id
}

resource "aws_ec2_transit_gateway_route" "route_internet" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.default_route_table.id
  destination_cidr_block        = "0.0.0.0/0"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.vpc_egress_attachment.id
}

resource "aws_ec2_transit_gateway_route_table_association" "vpc_1_association" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.default_route_table.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.vpc_1_attachment.id
}

resource "aws_ec2_transit_gateway_route_table_association" "vpc_2_association" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.default_route_table.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.vpc_2_attachment.id
}

resource "aws_ec2_transit_gateway_route_table_association" "vpc_egress_association" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.default_route_table.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.vpc_egress_attachment.id
}