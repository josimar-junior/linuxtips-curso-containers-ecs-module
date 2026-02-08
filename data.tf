data "aws_lb" "arn" {
  count = var.use_lb ? 1 : 0
  arn   = var.alb_arn
}

data "aws_iam_policy" "codedeploy" {
  name = "AWSCodeDeployRoleForECS"
}