output "nlb_arn" {
  value = aws_lb.target_lb.arn
}

output "nlb_dns" {
  value = aws_lb.target_lb.dns_name
}
