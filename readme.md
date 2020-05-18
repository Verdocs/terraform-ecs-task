# terraform-ecs-task

A Terraform module for creating:

- an ECS service
- an ECS task
- a load balancer

# Example Usage

```hcl
module "task-definition" {
  source = "github.com/Verdocs/terraform-ecs-task"

  app_name  = "taskname"
  lb_vpc_id = "vpc-1234abcd"

  lb_name              = "lb-name"
  lb_internal          = true
  lb_target_group_name = "lb-tg-name"
  lb_container_name    = "container-name"
  lb_protocol          = "TCP"
  lb_subnets           = ["subnet-1234abcd", "subnet-1234bcde"]

  service_name             = "service-name"
  service_cluster_arn      = "arn:aws:iam::1234567890:role/roleName"
  service_assign_public_ip = false
  service_security_groups  = "sg-1234abcd"

  task_family                = "task-family-name"
  task_role_arn              = "arn:aws:iam::1234567890:role/roleName"
  task_execution_role_arn    = "arn:aws:iam::1234567890:role/roleName"
  task_cpu                   = 1024
  task_memory                = 2048
  task_container_definitions = <<EOF
[
  {
    "name": "xray-daemon",
    "image": "amazon/aws-xray-daemon",
    "cpu": 32,
    "memoryReservation": 256,
      "portMappings" : [
         {
           "hostPort": 2000,
           "containerPort": 2000,
           "protocol": "udp"
          }
     ]
  }
]
EOF
}
```