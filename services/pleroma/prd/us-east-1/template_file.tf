data "template_file" "cloudfront_access_s3" {
  template = file("policies/cloudfront_s3_bucket_access_policy.json.tpl")

  vars = {
    origin_access_identity = aws_cloudfront_origin_access_identity.maintenance.id
    bucket_name            = aws_s3_bucket.maintenance.id
  }
}
