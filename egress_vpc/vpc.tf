module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.egress_vpc_name}"
  cidr = "${var.egress_vpc_cidr}"

  azs = ["${var.region}a", "${var.region}b"]
  public_subnets = ["10.0.2.0/26", "10.0.2.64/26"]
  private_subnets = ["10.0.2.128/26", "10.0.2.192/26"]

  map_public_ip_on_launch = true
  enable_nat_gateway = true

  # enable_ipv6 = false

  igw_tags = {
    "Name" = "${var.egress_vpc_name}-igw"
  }
}