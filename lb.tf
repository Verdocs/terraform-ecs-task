resource "aws_lb" "target_lb" {
  name                       = var.lb_name
  internal                   = var.lb_internal
  load_balancer_type         = var.lb_type
  subnets                    = var.lb_subnets
  enable_deletion_protection = var.lb_deletion_protection

  tags = {
    Environment = var.env
  }
}

resource "aws_lb_listener" "target_lb_listener" {
  protocol          = var.lb_protocol
  load_balancer_arn = aws_lb.target_lb.arn
  port              = var.lb_listener_port
  default_action {
    type             = var.lb_listener_action_type
    target_group_arn = aws_lb_target_group.target_target_group.arn
  }
}

resource "aws_lb_target_group" "target_target_group" {
  name        = var.lb_target_group_name
  port        = var.lb_app_port
  protocol    = var.lb_protocol
  target_type = var.lb_target_type
  vpc_id      = var.lb_vpc_id

  health_check {
    interval = var.lb_health_check_interval
    path     = var.lb_health_check_path
  }
}
