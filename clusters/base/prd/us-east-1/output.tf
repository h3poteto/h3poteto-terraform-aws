output "oidc_website_endpoint" {
  value = "${aws_s3_bucket.oidc.bucket_domain_name}"
}
