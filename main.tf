module "vpc1" {
  source = "./vpc1"
  prefix = var.prefix
  region = var.region
  vpc1_name = var.vpc1_name
  vpc1_cidr = var.vpc1_cidr
}

module "vpc2" {
  source = "./vpc2"
  prefix = var.prefix
  region = var.region
  vpc2_name = var.vpc2_name
  vpc2_cidr = var.vpc2_cidr

  depends_on = [ module.vpc1 ]
}

module "egress_vpc" {
  source = "./egress_vpc"
  prefix = var.prefix
  region = var.region
  egress_vpc_name = var.egress_vpc_name
  egress_vpc_cidr = var.egress_vpc_cidr

  depends_on = [ module.vpc2 ]
}

module "ec2" {
  source = "./ec2"
  prefix = var.prefix
  aws_ami = data.aws_ami.al2023_ami_amd.id

  vpc_1_subnets = module.vpc1.subnets
  vpc_2_subnets = module.vpc2.subnets
  vpc_egress_subnets = module.egress_vpc.private_subnets

  vpc_1_id = module.vpc1.vpc_id
  vpc_2_id = module.vpc2.vpc_id
  vpc_egress_id = module.egress_vpc.vpc_id

  depends_on = [ module.egress_vpc ]
}

module "transit_gateway" {
  source = "./transit_gateway"
  vpc_1_id = module.vpc1.vpc_id
  vpc_2_id = module.vpc2.vpc_id
  vpc_egress_id = module.egress_vpc.vpc_id
  vpc_1_subnets = module.vpc1.subnets
  vpc_2_subnets = module.vpc2.subnets
  vpc_egress_subnets = module.egress_vpc.private_subnets
  egress_vpc_igw_id  = module.egress_vpc.igw_id
  egress_private_rtb_ids = module.egress_vpc.private_rtb_ids
  vpc_1_rtb_ids = module.vpc1.rtb_ids
  vpc_2_rtb_ids = module.vpc2.rtb_ids
  vpc_1_cidr = module.vpc1.vpc_cidr_block

  depends_on = [ module.ec2 ]
}

module "endpoint" {
  source = "./endpoint"
  vpc_1_id = module.vpc1.vpc_id
  vpc_2_id = module.vpc2.vpc_id
  vpc_1_private_subnets = module.vpc1.subnets
  vpc_2_private_subnets = module.vpc2.subnets
  vpc_1_sg_id = module.ec2.vpc_1_sg_id
  vpc_2_sg_id = module.ec2.vpc_2_sg_id
  region = var.region
  
  depends_on = [ module.transit_gateway ]
}