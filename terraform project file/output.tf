data "aws_instances" "asg_instances" {
  filter {
    name   = "tag:Name"
    values = ["my_asg"]
  }

  filter {
    name   = "instance-state-name"
    values = ["running"]
  }

  depends_on = [aws_autoscaling_group.my_asg]
}

output "instance_public_ips" {
  value = data.aws_instances.asg_instances.public_ips
}
