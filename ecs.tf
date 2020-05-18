resource "aws_ecs_task_definition" "main_task" {
  family                   = var.task_family
  requires_compatibilities = [var.service_launch_type]
  network_mode             = var.task_network_mode
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  task_role_arn            = var.task_role_arn
  execution_role_arn       = var.task_execution_role_arn
  container_definitions    = var.task_container_definitions
}

resource "aws_ecs_service" "target_service" {
  name                              = var.service_name
  task_definition                   = aws_ecs_task_definition.main_task.arn
  cluster                           = var.service_cluster_arn
  desired_count                     = var.service_desired_count
  launch_type                       = var.service_launch_type
  platform_version                  = var.service_platform_version
  depends_on                        = [aws_lb_listener.target_lb_listener]
  health_check_grace_period_seconds = var.service_health_check_grace_period_seconds

  network_configuration {
    subnets          = var.lb_subnets
    security_groups  = [var.service_security_groups]
    assign_public_ip = var.service_assign_public_ip
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.target_target_group.arn
    container_name   = var.lb_container_name
    container_port   = var.lb_app_port
  }
}

