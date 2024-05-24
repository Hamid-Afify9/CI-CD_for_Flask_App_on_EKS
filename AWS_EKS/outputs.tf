output "VPC_Name" {
  value = module.vpc.id
}

output "availability_zones" {
  value = aws_vpc.main.availability_zones
}



