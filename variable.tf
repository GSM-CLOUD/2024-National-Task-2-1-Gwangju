variable "region" {
  default = "ap-northeast-2"
}

variable "awscli_profile" {
  default = "default"
}

variable "prefix" {
  default = "gwangju"
}

variable "vpc1_name" {
  default = "gwangju-VPC1"
}

variable "vpc1_cidr" {
  default = "10.0.0.0/24"
}

variable "vpc2_name" {
  default = "gwangju-VPC2"
}

variable "vpc2_cidr" {
  default = "10.0.1.0/24"
}

variable "egress_vpc_name" {
  default = "gwangju-EgressVPC"
}

variable "egress_vpc_cidr" {
  default = "10.0.2.0/24"
}