variable "app_name" {
  type        = string
  description = "provide the app name"
}

variable "env" {
  type        = string
  default     = "dev"
  description = "Indicates the environment of this terraform"
}



variable "service_name" {
  type = string
}

variable "service_security_groups" {
  type        = string
  description = "Security group of service"
}

variable "service_cluster_arn" {
  type = string
}

variable "service_desired_count" {
  default = 1
  type    = number
}

variable "service_platform_version" {
  default = "LATEST"
  type    = string
}

variable "service_launch_type" {
  type        = string
  default     = "FARGATE"
  description = "The launch type for the task."
}

variable "service_assign_public_ip" {
  default = true
  type    = bool
}

// Default set as per https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service_definition_parameters.html
variable "service_health_check_grace_period_seconds" {
  default = 0
  type    = number
}



variable "task_role_arn" {
  type = string
}

variable "task_execution_role_arn" {
  type = string
}

variable "task_family" {
  type = string
}

variable "task_cpu" {
  default = 1024
  type    = number
}

variable "task_memory" {
  default = 2048
  type    = number
}

variable "task_network_mode" {
  default = "awsvpc"
  type    = string
}

variable "task_container_definitions" {
  type = string
}



variable "lb_name" {
  type = string
}

variable "lb_internal" {
  default = false
}

variable "lb_vpc_id" {
  type        = string
  description = "Id of VPC should be provided"
}

variable "lb_app_port" {
  default     = 3000
  type        = string
  description = "vForm node app port"
}

variable "lb_type" {
  default = "network"
  type    = string
}

variable "lb_subnets" {
  type        = list(string)
  description = "A list of subnet IDs to attach to the LB. Change of value will force re creation of NLB"
}

variable "lb_deletion_protection" {
  default = false
  type    = bool
}

variable "lb_container_name" {
  type = string
}

variable "lb_target_group_name" {
  type = string
}

variable "lb_health_check_interval" {
  default = 30
  type    = number
}

variable "lb_health_check_path" {
  default = "/health_check"
  type    = string
}

variable "lb_protocol" {
  default = "HTTP"
  type    = string
}

variable "lb_target_type" {
  default = "ip"
  type    = string
}

variable "lb_listener_port" {
  default = 80
  type    = number
}

variable "lb_listener_action_type" {
  default = "forward"
  type    = string
}
