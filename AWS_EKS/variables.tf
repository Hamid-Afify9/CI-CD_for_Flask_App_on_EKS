variable private_subnets_cidr{}
variable public_subnets_cidr{}
variable vpc_cidr{
    description = "The CIDR block for the VPC"
    default = "10.0.0.0/16"
}


variable  engine{}
variable  engine_version{}
variable  multi_az{}                         
variable  identifier{}
variable "rds_username" {
type = string
sensitive = true
}

variable "rds_password" {
type = string
sensitive = true
}
variable  instance_class{}
variable  allocated_storage{}
variable  db_subnet_group_name{}
variable  vpc_security_group_ids{}
variable  availability_zone{}
variable  storage_type{}
variable  db_name{}
variable  skip_final_snapshot{}