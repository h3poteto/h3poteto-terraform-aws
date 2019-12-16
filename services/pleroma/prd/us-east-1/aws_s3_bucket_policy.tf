resource "aws_s3_bucket_policy" "maintenance" {
  bucket = aws_s3_bucket.maintenance.id

  policy = data.template_file.cloudfront_access_s3.rendered
}
