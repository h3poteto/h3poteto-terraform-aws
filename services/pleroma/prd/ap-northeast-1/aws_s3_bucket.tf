resource "aws_s3_bucket" "maintenance" {
  bucket = "maintenance.pleroma.io"
  acl    = "public-read"

  website {
    index_document = "index.html"
  }
}

