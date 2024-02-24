output "vpc_id" {
  value = aws_vpc.default.id
}


output "subnet-1_id" {
  value = aws_subnet.subnet1-public.id
}


output "sg_id" {
  value = aws_security_group.allow_all.id
}


output "Instance_ip" {
  value = aws_instance.web-1.public_ip
}
