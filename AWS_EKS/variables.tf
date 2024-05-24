variable private_subnets_cidr{}
variable public_subnets_cidr{}
variable vpc_cidr{
    description = "The CIDR block for the VPC"
    default = "10.0.0.0/16"
}