resource "aws_instance" "web-1" {
  ami = var.amis
  availability_zone           = "ap-south-1a"
  instance_type               = "t2.large"
  key_name                    = "TF_key"
  subnet_id                   = aws_subnet.subnet1-public.id
  vpc_security_group_ids      = [aws_security_group.allow_all.id]
  associate_public_ip_address = true
  # iam_instance_profile        = data.aws_iam_instance_profile.existing_role.role_name # Replace with the existing IAM instance profile name
  tags = {
    Name = "Server-1"
    Owner = "Satya_Sai"
  }

  root_block_device {
    volume_size = 20
  }

  user_data = <<-EOF
#!/bin/bash
apt update
apt install -y nginx
service nginx start
echo "<div><h1>$(cat /etc/hostname)</h1></div>" | tee -a /var/www/html/index.nginx-debian.html
              EOF
}

resource "aws_key_pair" "TF_key" {
  key_name   = "TF_key"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "TF-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "tfkey"
}
