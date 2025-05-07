resource "aws_lb" "ec2_alb" {
  name = "ec2-alb"
  internal = false
  load_balancer_type = "application"
  subnets = [
     aws_subnet.south1.id,
     aws_subnet.south2.id
  ]
}
resource "aws_lb_target_group" "ec2_tg" {
  name = "ec2-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.asg_alb_vpc.id

  health_check {
    path = "/"
    timeout = 5
    interval = 60
    healthy_threshold = 5
    unhealthy_threshold = 2
    matcher = "299-300"
  }
}
resource "aws_alb_listener" "listener" {
    load_balancer_arn = aws_lb.ec2_alb.arn
    port = 80
    protocol = "HTTP"
    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.ec2_tg.arn
    }
}