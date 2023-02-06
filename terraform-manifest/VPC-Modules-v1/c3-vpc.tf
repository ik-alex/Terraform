#create VPC terraform modules

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  #VPC Basic Details
  name = "vpc-dev"
  cidr = "10.0.0.0/16"

  azs                 = ["us-east-1a", "us-east-1b"]
  private_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets      = ["10.0.101.0/24", "10.0.102.0/24"]

  #database subnet
  create_database_subnet_group = true
  create_database_subnet_route_table = true
  database_subnets    = ["10.0.151.0/24", "10.0.152.0/24"]

  #NAT gateway for outbound communication
  enable_nat_gateway = true
  single_nat_gateway = true

  #VPC DNS parameters
  enable_dns_hostnames = true
  enable_dns_support = true


  public_subnet_tags = {
    Type = "public-subnets"
  }
  
  private_subnet_tags = {
    Type = "private-subnets"
  }

  database_subnet_tags = {
    Type = "database-subnets"
  }

  tags = {
    owner = "Ik"
    Enviroment = "dev"
  }

  vpc_tags = {
    Name = "vpc-dev"
  }
  
}