#     __      __  _____     _____
#     \ \    / / |  __ \   / ____|
#      \ \  / /  | |__) | | |     
#       \ \/ /   |  ___/  | |     
#        \  /    | |      | |____
#         \/     |_|       \_____|

module "simple-vpc" {

  source = "./../../../terraform-aws-vpc"
  #source = "john-morsley/vpc/aws"

  name = local.vpc_name

  vpc_cidr = var.vpc_cidr

  public_subnet_cidrs = var.public_subnet_cidr

  availability_zones = [data.aws_availability_zones.available.names[0]]

}