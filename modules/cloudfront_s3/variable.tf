variable "s3_bucket_domain_name" {}

variable "s3_bucket_name" {}

variable "s3_logging_bucket_domain_name" {}

variable "s3_logging_prefix" {
  default = ""
}

variable "alternate_domains" {
  default = []
}

variable "allowed_methods" {
  default = ["GET", "HEAD"]
}

variable "acm_certificate_arn" {}

variable "enabled" {
  default = true
}

variable "is_ipv6_enabled" {
  default = true
}

variable "whitelisted_headers" {
  default = ["Origin"]
}

variable "default_root_object" {
  default = ""
}
