resource "aws_route" "vpc1_to_egress_a" {
  route_table_id = var.vpc_1_rtb_ids[0]
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
}

resource "aws_route" "vpc1_to_egress_b" {
  route_table_id = var.vpc_1_rtb_ids[1]
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
}

resource "aws_route" "vpc2_to_egress_a" {
  route_table_id = var.vpc_2_rtb_ids[0]
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
}

resource "aws_route" "vpc2_to_egress_b" {
  route_table_id = var.vpc_2_rtb_ids[1]
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
}

resource "aws_route" "egress_to_vpc1_a" {
  route_table_id         = var.egress_private_rtb_ids[0]
  destination_cidr_block = var.vpc_1_cidr
  transit_gateway_id     = aws_ec2_transit_gateway.transit_gateway.id
}

resource "aws_route" "egress_to_vpc1_b" {
  route_table_id         = var.egress_private_rtb_ids[1]
  destination_cidr_block = var.vpc_1_cidr
  transit_gateway_id     = aws_ec2_transit_gateway.transit_gateway.id
}