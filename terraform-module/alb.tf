resource "aws_lb" "demo_infra_alb" {
  name               = "demo-infra-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]
  subnets            = [for subnet in aws_subnet.public_subnets : subnet.id]

  enable_deletion_protection = false


  tags = {
    Name        = "demo-infra-alb"
    Environment = "demo"
  }
}


resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.demo_infra_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.demo-infra-TG.arn
  }
}