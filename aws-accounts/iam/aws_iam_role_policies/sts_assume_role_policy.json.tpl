{
  "Version":"2012-10-17",
  "Statement": [
    {
      "Effect":"Allow",
      "Principal": {
        "AWS": "${arn}"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
