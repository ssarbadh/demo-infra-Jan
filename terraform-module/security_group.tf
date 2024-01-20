# ALB Security Group 
# Allow 0.0.0.0/0 on Port 80

# ec2 Instace SG 
# Allow 22 from my public IP for debugging 
# Allow 80 from ALB SG 

resource "aws_security_group" "alb-sg" {
  name        = "alb-sg"
  description = "Security Group for ALB"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "alb-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4_alb" {
  security_group_id = aws_security_group.alb-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_alb" {
  security_group_id = aws_security_group.alb-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


resource "aws_security_group" "instance-sg" {
  name        = "instance-sg"
  description = "Security Group for Instances"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "instance-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4_instance" {
  security_group_id            = aws_security_group.instance-sg.id
  referenced_security_group_id = aws_security_group.alb-sg.id
  from_port                    = 80
  ip_protocol                  = "tcp"
  to_port                      = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4_instance" {
  security_group_id = aws_security_group.alb-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_instance" {
  security_group_id = aws_security_group.instance-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}