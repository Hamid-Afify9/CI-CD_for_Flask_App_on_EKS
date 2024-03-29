data "aws_availability_zones" "azs" {}



module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.6.0"



  name = "my-vpc"
  cidr = var.vpc_cidr

  azs             = data.aws_availability_zones.azs.names
  private_subnets = var.private_subnets_cidr
  public_subnets  = var.public_subnets_cidr

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true
  
  tags={
    "kubernetes.io/cluster/eks-cluster1" = "my-cluster"
    name= "eks-cluster1"
    
  }
  public_subnet_tags = {
    "kubernetes.io/cluster/eks-cluster1" = "my-cluster"
    "kubernetes.io/role/elb" = "1"
  }
  private_subnet_tags = {
    "kubernetes.io/cluster/eks-cluster1" = "my-cluster"
    "kubernetes.io/role/internal-elb" = "1"
  }
  


}