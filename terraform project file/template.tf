resource "aws_launch_template" "ec2_template" {
  image_id               = var.ami_id
  name_prefix            = "alb-instance"
  instance_type          = var.instance_type
  key_name               = var.key_pair
  user_data              = filebase64("${path.module}/new_data.sh")

  network_interfaces {
    device_index              = 0
    associate_public_ip_address = true
    security_groups           = [aws_security_group.alb_sg.id]
  }
}
