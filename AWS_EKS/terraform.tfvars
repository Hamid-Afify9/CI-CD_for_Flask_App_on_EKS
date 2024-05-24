private_subnets_cidr=["10.0.2.0/24", "10.0.3.0/24"]
public_subnets_cidr=["10.0.0.0/24", "10.0.1.0/24"]
vpc_cidr= "10.0.0.0/16"





engine=  MySQL
engine_version= 5.7 
multi_az=  false
identifier=  mydb
instance_class=  db.t2.micro
allocated_storage=  20
db_subnet_group_name=  aws_db_subnet_group.database_subnet_group.name
vpc_security_group_ids=   [aws_security_group.database_security_group.id]
availability_zone=  us-west-2a
storage_type=   gp2
db_name=  mydb
skip_final_snapshot=  true 