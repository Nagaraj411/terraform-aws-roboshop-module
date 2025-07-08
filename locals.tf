locals {
  ami_id                   = data.aws_ami.joindevops.id
  vpc_id                   = data.aws_ssm_parameter.vpc_id.value

  private_subnet_id        = split(",", data.aws_ssm_parameter.private_subnet_ids.value)[0]
  private_subnet_ids       = split(",", data.aws_ssm_parameter.private_subnet_ids.value)

  # catalogue_sg_id          = data.aws_ssm_parameter.catalogue_sg_id.value

  frontend_alb_listener_arn = data.aws_ssm_parameter.frontend_alb_listener_arn.value
  backend_alb_listener_arn = data.aws_ssm_parameter.backend_alb_listener_arn.value
  alb_listener_arn = "${var.component}" == "frontend" ? local.frontend_alb_listener_arn : local.backend_alb_listener_arn

  sg_id = data.aws_ssm_parameter.sg_id.value
  tg_port = "${var.component}" == "frontend" ? 80 : 8080 # if frontend port is 80, otherwise port is 8080
  health_check_path = "${var.component}" == "frontend" ? "/" :"/health"

  rule_header_url = "${var.component}" == "frontend" ? "${var.environment}.${var.zone_name}" : "${var.component}.backend-${var.environment}.${var.zone_name}"

  common_tags = {
    Project     = var.project
    Environment = var.environment
    terraform   = "true"
  }
}