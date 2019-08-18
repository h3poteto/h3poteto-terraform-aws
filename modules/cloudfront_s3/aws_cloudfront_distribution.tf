resource "aws_cloudfront_distribution" "assets" {
  origin {
    domain_name = var.s3_bucket_domain_name
    origin_id   = "S3-${var.s3_bucket_name}"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }

  enabled             = var.enabled
  is_ipv6_enabled     = var.is_ipv6_enabled
  comment             = var.s3_bucket_name
  default_root_object = var.default_root_object

  logging_config {
    include_cookies = false
    bucket          = var.s3_logging_bucket_domain_name
    prefix          = var.s3_logging_prefix
  }

  aliases = var.alternate_domains


  default_cache_behavior {
    allowed_methods  = var.allowed_methods
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-${var.s3_bucket_name}"

    forwarded_values {
      query_string = false
      headers      = var.whitelisted_headers

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Bucket = var.s3_bucket_name
  }

  viewer_certificate {
    cloudfront_default_certificate = false
    acm_certificate_arn            = var.acm_certificate_arn
    minimum_protocol_version       = "TLSv1.1_2016"
    ssl_support_method             = "sni-only"
  }
}
