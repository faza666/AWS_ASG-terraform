resource "aws_lb" "ALB-for-AWS-ASG" {
  name               = "ALB-for-AWS-ASG"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.SG_for_ASG_ALB.id]
  subnets            = data.aws_subnets.my_default_vpc_subnets_ids.ids
  idle_timeout       = 60
  tags               = merge(var.tag_block, { Name = "AWS-ASG-Load_Balancer" })
}


resource "aws_lb_target_group" "AWS-ASG-Target-Group" {
  name        = var.target_group_name
  port        = 80
  protocol    = "HTTP"
  vpc_id      = data.aws_vpc.default.id
  tags        = merge(var.tag_block, { Name = "AWS-ASG-Target-Group" })
  target_type = "instance"
}


resource "aws_lb_listener" "AWS-ASG-Listener" {
  load_balancer_arn = aws_lb.ALB-for-AWS-ASG.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.AWS-ASG-Target-Group.arn
  }
  tags = merge(var.tag_block, { Name = "AWS-ASG-Listener" })
}
