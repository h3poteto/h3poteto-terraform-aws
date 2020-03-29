resource "random_uuid" "oidc_s3" {
}

resource "aws_s3_bucket" "oidc" {
  bucket = "oidc-${random_uuid.oidc_s3.result}"
  acl    = "private"

  versioning {
    enabled = true
  }
}
