resource "aws_launch_template" "AWS_ASG_launch_template" {
  name        = "AWS_ASG_launch_template"
  description = "Launch template for my terraform AWS Autoscaling Group"

  image_id               = data.aws_ami.Amazon_Linux_2_latest.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.SG_for_ASG_EC2.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name    = "Web Server Build by Terraform"
      Owner   = "Dmitriy Blinnikov"
      Project = "Terraform Lessons"
    }
  }

  user_data = filebase64("user-data.sh")
}
