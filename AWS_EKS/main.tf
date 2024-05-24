# Description: Create RDS instance

data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = ["eks-vpc"]
  
  }
}


# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}


# create a default subnet in the first az if one does not exit
resource "aws_subnet" "subnet_az1" {
    vpc_id            =  data.aws_vpc.main.id
    cidr_block        = "10.0.4.0/24"
    availability_zone = us-west-2a
    map_public_ip_on_launch =  true
    tags   = {
        Name = rds-subnet-az1
    }
}

# create a default subnet in the second az if one does not exit
resource "aws_default_subnet" "subnet_az2" {
  vpc_id            =  data.aws_vpc.main.id
    cidr_block        = "10.0.5.0/24"
    availability_zone = us-west-2b
    map_public_ip_on_launch =  true
    tags   = {
        Name = rds-subnet-az2
    }
}



# create security group for the database
resource "aws_security_group" "database_security_group" {
  name        = "database security group"
  description = "enable mysql/aurora access on port 3306"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    description      = "mysql/aurora access"
    from_port        =   3306
    to_port          =   3306
    protocol         =   tcp
    security_groups  =   [aws_security_group.database_security_group.id]
  }

  egress {
    from_port        =   0
    to_port          =   0
    protocol         =   -1
    cidr_blocks      =   ["0.0.0.0/0"]
  }

  tags   = {
    Name =   database_security_group
  }
}


# create the subnet group for the rds instance
resource "aws_db_subnet_group" "database_subnet_group" {
  name         = RDS-subnet-group
  subnet_ids   = [aws_subnet.subnet_az1.id, aws_subnet.subnet_az2.id]
  description  = "subnet group for rds instance"

  tags   = {
    Name =  RDS-subnet-group
  }
}

resource "aws_db_instance" "db_instance" {
engine                  =  var.engine
engine_version          =  var.engine_version
multi_az                =  var.multi_az
identifier              =  var.identifier
#passed in GithubActions as: env:
 #                               TF_VAR_rds_username: ${{ secrets.RDS_USERNAME }} 
 #                               TF_VAR_rds_password: ${{ secrets.RDS_PASSWORD }}
username                =  var.rds_username
password                =  var.rds_password
instance_class          =  var.instance_class
allocated_storage       =  var.allocated_storage
db_subnet_group_name    =  var.db_subnet_group_name
vpc_security_group_ids  =  var.vpc_security_group_ids
availability_zone       =  var.availability_zone
storage_type            =  var.storage_type
db_name                 =  var.db_name
skip_final_snapshot     =  var.skip_final_snapshot
# ... other variables and resource definitions
}