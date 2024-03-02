output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}

output "web_target_group_arn" {
  value = aws_lb_target_group.web.arn
}
