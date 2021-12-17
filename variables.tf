variable "current_region" {
  type        = string
  description = "aws region name"
  default     = "eu-central-1"
}

variable "ec2_security_group_name" {
  type    = string
  default = "AWS-ASG-EC2-server-SG"
}

variable "alb_security_group_name" {
  type    = string
  default = "AWS-ASG-ALB-SG"
}

variable "launch_template_name" {
  type    = string
  default = "AWS-ASG-Launch_Template"
}

variable "load_balancer_name" {
  type    = string
  default = "AWS-ASG-Load_Balancer"
}

variable "target_group_name" {
  type    = string
  default = "AWS-ASG-Target-Group"
}



variable "tag_block" {
  type = map(any)
  default = {
    Owner       = "Dmitriy Blinnikov"
    Project     = "AWS Autoscaling Group"
    Created_via = "Terraform"
  }
}
