aws_region          = "ap-south-1"
amis = "ami-03f4878755434977f"
vpc_cidr            = "10.35.0.0/16"
public_subnet1_cidr = "10.35.1.0/24"
public_subnet2_cidr = "10.35.2.0/24"
public_subnet3_cidr = "10.35.3.0/24"
vpc_name            = "DevSecOpsB35"
IGW_name            = "DevSecOpsB35-IGW"
key_name            = "TF_key"
public_subnet1_name = "DevSecOpsB35-PublicSubnet-1"
public_subnet2_name = "DevSecOpsB35-PublicSubnet-2"
public_subnet3_name = "DevSecOpsB35-PublicSubnet-3"
Main_Routing_Table  = "DevSecOpsB35-Main-RT"
azs                 = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
environment         = "Development"
instance_type = {
  dev  = "t2.micro"
  test = "t2.medium"
  prod = "t2.large"
}
# role_name           = "Role_Name"