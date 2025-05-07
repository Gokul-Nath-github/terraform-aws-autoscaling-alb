resource "aws_autoscaling_group" "my_asg" {
  max_size = 4
  min_size = 3
  desired_capacity = 3
  vpc_zone_identifier = [
        aws_subnet.south1.id,
        aws_subnet.south2.id
  ]
  launch_template {
    id = aws_launch_template.ec2_template.id
  }
  target_group_arns = [aws_lb_target_group.ec2_tg.arn]
  health_check_type = "ELB"
  health_check_grace_period = 300

  tag {
    key = "Name"
    value = "my_asg"
    propagate_at_launch = true
  }
}
