resource "aws_lb" "alb" {
  name                       = var.AlbName
  internal                   = false
  load_balancer_type         = var.AlbType
  security_groups            = [module.core_compute.security_group_id]
  subnets                    = [module.core_compute.public_subnet_ids[0], module.core_compute.public_subnet_ids[1]]
  enable_deletion_protection = false
}

resource "aws_lb_target_group" "alb_tg" {
  name     = var.AlbTgName
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.core_compute.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "lb_listener_http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "ec2_web" {
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = module.core_compute.instance_web_id
  port             = 80
}
