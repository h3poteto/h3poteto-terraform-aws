resource "aws_s3_bucket" "redirect_masuda_stream" {
  bucket = "redirect.masuda-stream.net"
  acl    = "public-read"

  website {
    redirect_all_requests_to = "https://masuda.stream"
  }
}

