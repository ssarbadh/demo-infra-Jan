resource "aws_launch_template" "demo-infra-lt" {
  name_prefix   = "demo-infra-lt-"
  image_id      = var.ami-id
  instance_type = var.instance-type
  #   key_name               = var.key
  vpc_security_group_ids = [aws_security_group.instance-sg.id]
  user_data              = filebase64("${path.module}/userdata.sh")
  update_default_version = true

  #   iam_instance_profile {
  #     name = "${var.cluster-name}-node-instance-profile"
  #   }

  tags = {
    Name = "demo-infra-LT"

  }
}

