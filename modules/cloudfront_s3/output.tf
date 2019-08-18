output "domain_name" {
  value = aws_cloudfront_distribution.assets.domain_name
}

output "hosted_zone_id" {
  value = aws_cloudfront_distribution.assets.hosted_zone_id
}
