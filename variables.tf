variable "region" {
  type        = string
  description = "The AWS region to deploy resources into."
}

variable "cluster_name" {
  type        = string
  description = "The name of the ECS cluster."
}

variable "service_name" {
  type        = string
  description = "The name of the ECS service."
}
variable "container_image" {
  type        = string
  description = "The container image to use for the ECS service."
}
variable "vpc_id" {}
variable "private_subnets" {}
variable "service_port" {}
variable "service_cpu" {}
variable "service_memory" {}
variable "service_listener" {
  type    = string
  default = null
}
variable "service_task_execution_role" {}
variable "environment_variables" {
  type = list(object({
    name : string,
    value : string
  }))
  description = "A list of the environment variables that will be passed to the service"
}
variable "secrets" {
  type = list(object({
    name : string,
    valueFrom : string
  }))
  description = "A list of secrets from the Parameter Store or Secret Manager"
}
variable "capabilities" {
  type = list(any)
}
variable "service_healthcheck" {
  type = map(any)
}
variable "service_launch_type" {
  type = list(object({
    capacity_provider = string
    weight            = number
  }))
  default = [{
    capacity_provider = "SPOT"
    weight            = 100
  }]
}
variable "service_task_count" {}
variable "service_hosts" {}

### Autoscaling ###
variable "scale_type" {
  default = null
}
variable "task_minimum" {
  default = 3
}
variable "task_maximum" {
  default = 10
}

### CPU Autoscaling ###
variable "scale_out_cpu_threshold" {
  default = 80
}
variable "scale_out_adjustment" {
  default = 1
}
variable "scale_out_comparison_operator" {
  default = "GreaterThanOrEqualToThreshold"
}
variable "scale_out_statistic" {
  default = "Average"
}
variable "scale_out_period" {
  default = 60
}
variable "scale_out_evaluation_periods" {
  default = 2
}
variable "scale_out_cooldown" {
  default = 60
}
variable "scale_in_cpu_threshold" {
  default = 30
}
variable "scale_in_adjustment" {
  default = -1
}
variable "scale_in_comparison_operator" {
  default = "LessThanOrEqualToThreshold"
}
variable "scale_in_statistic" {
  default = "Average"
}
variable "scale_in_period" {
  default = 120
}
variable "scale_in_evaluation_periods" {
  default = 3
}
variable "scale_in_cooldown" {
  default = 120
}

### CPU Tracking ###
variable "scale_tracking_cpu" {
  default = 80
}

### Request Tracking ###
variable "alb_arn" {
  default = null
}
variable "scale_tracking_requests" {
  default = 0
}
variable "efs_volumes" {
  description = "A list of EFS volumes to be mounted in the ECS task."
  type = list(object({
    volume_name : string
    file_system_id : string
    file_system_root : string
    mount_point : string
    read_only : bool
  }))
  default = []
}

variable "service_discovery_namespace" {
  default     = null
  description = "The Namespace ID of the Service Discovery"
}

variable "service_protocol" {
  type    = string
  default = null
}

variable "protocol" {
  type    = string
  default = "tcp"
}

variable "use_service_connect" {
  type    = bool
  default = false
}

variable "service_connect_name" {
  type    = string
  default = null
}

variable "service_connect_arn" {
  type    = string
  default = null
}

variable "use_lb" {
  type        = bool
  default     = true
  description = "Enable the Load Balancer on the service"
}

### CODE DEPLOY ###
variable "deployment_controller" {
  type    = string
  default = "ECS"
}

variable "codedeploy_strategy" {
  type    = string
  default = "CodeDeployDefault.ECSAllAtOnce"
}

variable "codedeploy_deployment_option" {
  type    = string
  default = "WITH_TRAFFIC_CONTROL"
}

variable "codedeploy_deployment_type" {
  type    = string
  default = "BLUE_GREEN"
}

variable "codedeploy_termination_wait_time_in_minutes" {
  type    = number
  default = 5
}

variable "codedeploy_rollback_alarm" {
  type    = bool
  default = true
}

variable "codedeploy_rollback_error_threshold" {
  type    = number
  default = 10
}

variable "codedeploy_rollback_error_period" {
  type    = number
  default = 60
}

variable "codedeploy_rollback_error_evaluation_period" {
  type    = number
  default = 1
}