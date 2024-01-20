resource "aws_lb_target_group" "demo-infra-TG" {
  name     = "demo-infra-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  
  health_check {
    enabled = true
    healthy_threshold = 5
    interval = 30
    protocol = "HTTP"
    port = 80
    timeout = 5
    unhealthy_threshold = 5

  }


}
