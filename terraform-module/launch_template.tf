resource "aws_launch_template" "demo-infra-lt" {
  name_prefix = "demo-infra-lt-"
  #   image_id      = var.ami-id
  image_id      = data.aws_ami.latest.id
  instance_type = var.instance-type
  #   key_name               = var.key
  vpc_security_group_ids = [aws_security_group.instance-sg.id]
  user_data              = filebase64("${path.module}/userdata.sh")
  update_default_version = true

  tags = {
    Name = "demo-infra-LT"

  }
}

