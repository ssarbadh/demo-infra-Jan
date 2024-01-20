resource "aws_autoscaling_group" "demo-infra-asg" {
  name_prefix      = "demo-infra-asg"
  desired_capacity = var.desired-node
  max_size         = var.maximum-node
  min_size         = var.minimum-node

  vpc_zone_identifier = [for subnet in aws_subnet.private_subnets : subnet.id]

  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true

  target_group_arns = [aws_lb_target_group.demo-infra-TG.arn]

  launch_template {
    id      = aws_launch_template.demo-infra-lt.id
    version = var.launch_template_version
  }


  tag {
    key                 = "Name"
    value               = "demo-infra-asg"
    propagate_at_launch = true
  }

  tag {
    key                 = "environment"
    value               = "dev"
    propagate_at_launch = true
  }

}

resource "aws_autoscaling_policy" "demo-infra-asg-scaling" {
  name                   = "demo-infra-asg-scaling"
  autoscaling_group_name = aws_autoscaling_group.demo-infra-asg.name
  policy_type            = "TargetTrackingScaling"
  enabled                = true

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 10.0
  }
  depends_on = [aws_autoscaling_group.demo-infra-asg]
}
