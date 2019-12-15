resource "aws_cloudfront_distribution" "maintenance" {
  enabled             = true
  price_class         = "PriceClass_All"
  http_version        = "http2"
  default_root_object = "error_page.html"

  origin {
    origin_id   = "S3-${aws_s3_bucket.maintenance.id}"
    domain_name = aws_s3_bucket.maintenance.bucket_domain_name

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.maintenance.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    allowed_methods = ["GET", "HEAD", "DELETE", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods  = ["GET", "HEAD"]

    forwarded_values {
      query_string = "false"
      headers      = ["Origin"]

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = "0"
    default_ttl            = "300"  //3600
    max_ttl                = "1200" //86400
    target_origin_id       = "S3-${aws_s3_bucket.maintenance.id}"

    compress = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = var.cloudfront_certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1"
  }

  aliases = ["pleroma.io"]

  custom_error_response {
    error_caching_min_ttl = 300
    error_code            = 404
    response_code         = 503
    response_page_path    = "/error_page.html"
  }

  custom_error_response {
    error_caching_min_ttl = 300
    error_code            = 403
    response_code         = 503
    response_page_path    = "/error_page.html"
  }
}

