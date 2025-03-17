module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.vpc2_name}"
  cidr = "${var.vpc2_cidr}"

  azs = ["${var.region}a", "${var.region}b"]
  private_subnets = ["10.0.1.0/26", "10.0.1.64/26"]

  map_public_ip_on_launch = false
  enable_nat_gateway = false
  enable_ipv6 = false
}