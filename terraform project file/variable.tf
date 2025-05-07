variable "sg_name" {
  default = "alb_sg"
  description = "this the defaullt name for my sg"
}
variable "sg_cidr" {
  default = ["0.0.0.0/0"]
  description = "this is my cidr block for my sg"
}
variable "instance_type" {
  default = "t2.micro"
  description = "this is the instance type for my instance"
}
variable "ami_id" {
  default = "ami-0e35ddab05955cf57"
  description = "this is the ami id for my instance"
}
variable "ingress_value" {
  type = list(number)
  default = [ 22,80 ]
  description = "this is the ingress value from the ports"
}
variable "sg_description" {
    default = "this is security group will allow traffic from alb"
    description = "this is the decription for my security group description"
}
variable "region" {
  default = "ap-south-1"
  description = "this is the default region where resources are luanched"
}
variable "key_pair" {
  default = "gg"
  description = "this is the key for the alb instances"
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "subnets" {
  description = "the subnets of the vpc"
  type = list(string)
  default = [ "south1" , "south2","south3"]
}