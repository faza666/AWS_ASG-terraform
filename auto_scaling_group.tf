resource "aws_autoscaling_group" "TERRAFORM_ASG" {
  name                      = "my-terraform_ASG"
  max_size                  = 3
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  launch_template {
    id = aws_launch_template.AWS_ASG_launch_template.id
  }
  vpc_zone_identifier = data.aws_subnets.my_default_vpc_subnets_ids.ids
  target_group_arns   = [aws_lb_target_group.AWS-ASG-Target-Group.arn]
}


resource "aws_autoscaling_policy" "ASG_scale_policy" {
  name                   = "ASG_scale_policy"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.TERRAFORM_ASG.name
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 60.0
  }
}
