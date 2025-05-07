# terraform-aws-autoscaling-alb
Terraform project to deploy EC2 instances with Auto Scaling behind an Application Load Balancer in aws

This Terraform project sets up an infrastructure on AWS that includes:

- A custom VPC with public subnets
- An Application Load Balancer (ALB)
- An Auto Scaling Group (ASG) with EC2 instances
- Launch Template with Apache web server provisioning
- Security Groups with ingress/egress rules
- Outputs public IPs of running EC2 instances

---


## 📋 Prerequisites

- [Terraform](https://www.terraform.io/downloads)
- AWS CLI configured with valid credentials
- SSH Key Pair created in AWS (used for EC2 access)

---
# Deployment
- Initialize Terraform
```terraform init```
- Validate the configuration
```terraform plan```
- Apply Infrastructure
```terraform apply```

# Outputs
instance_public_ips – Lists the public IPs of EC2 instances launched via the ASG.

# Customization
Modify new_data.sh to install different software or configure the server differently.
Adjust desired_capacity, min_size, or max_size in aws_autoscaling_group to control instance scaling.
Add ALB DNS output for easy access.

# Teardown
To destroy all resources:
```terraform destroy```
Confirm with yes when prompted.

# Troubleshooting
Security Group Errors: Ensure that security groups are only defined inside the network_interfaces block when using Launch Templates.
No Public IPs: Ensure subnets are public and associate_public_ip_address = true is set in the launch template.
AZ/Instance Type Errors: Confirm that the chosen instance type (e.g., t2.micro) is supported in the specified availability zones

## Author
[Gokul Nath RK](www.linkedin.com/in/gokul-nath-501026321)
