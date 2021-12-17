resource "aws_security_group" "SG_for_ASG_EC2" {
  name        = "WebServer Security Group"
  description = "Allow HTTP inbound traffic"

  ingress {
    description     = "Allow HTTP"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.SG_for_ASG_ALB.id]
    # cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "Security Group for my Web Server"
    Description = "Security Group for my EC2 instance Build by Terraform"
    Owner       = "Dmitriy Blinnikov"
    Project     = "AWS Autoscaling Group"
  }
}

resource "aws_security_group" "SG_for_ASG_ALB" {
  name        = "Load Balancer Security Group"
  description = "Allow HTTP inbound traffic"

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "SG_for_ASG_ALB"
    Description = "Security Group for my Load Balancer Build by Terraform"
    Owner       = "Dmitriy Blinnikov"
    Project     = "AWS Autoscaling Group"
  }
}
