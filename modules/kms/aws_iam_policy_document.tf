data "aws_iam_policy_document" "kms" {
  statement {
    sid = "AllowUseOfTheKey"

    # 暗号化/復号化用のポリシー
    # https://docs.aws.amazon.com/ja_jp/kms/latest/developerguide/key-policies.html
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey",
    ]

    resources = [aws_kms_key.key.arn]
  }
}
