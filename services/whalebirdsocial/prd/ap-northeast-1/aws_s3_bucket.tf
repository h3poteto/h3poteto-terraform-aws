resource "aws_s3_bucket" "redirect_whalebird_org" {
  bucket = "redirect.whalebird.org"
  acl    = "public-read"

  website {
    redirect_all_requests_to = "https://whalebird.social"
  }
}
