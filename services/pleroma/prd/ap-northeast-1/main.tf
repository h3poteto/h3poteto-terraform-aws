module "media_cloudfront" {
  source                        = "../../../../modules/cloudfront_s3"
  s3_bucket_domain_name         = "media.pleroma.io.s3.amazonaws.com"
  s3_bucket_name                = "media.pleroma.io"
  s3_logging_bucket_domain_name = "log.media.pleroma.io.s3.amazonaws.com"
  alternate_domains             = ["media.pleroma.io"]
  acm_certificate_arn           = var.cloudfront_certificate_arn
}

