resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "${var.s3_bucket_name}-access-identity"
}
