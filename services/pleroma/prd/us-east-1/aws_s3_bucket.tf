resource "aws_s3_bucket" "maintenance" {
  bucket = "maintenance-pleroma-io"
}

resource "aws_s3_bucket" "log_maintenance" {
  bucket = "log-maintenance-pleroma-io"
}
