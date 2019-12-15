{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "2",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity ${origin_access_identity}"
      },
      "Action": "s3:Get*",
      "Resource": "arn:aws:s3:::${bucket_name}/*"
    }
  ]
}
