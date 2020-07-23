resource "aws_ecr_lifecycle_policy" "fascia_last" {
  repository = aws_ecr_repository.fascia.name

  policy = file("aws_ecr_lifecycle_policy/last.json")
}

resource "aws_ecr_lifecycle_policy" "seiyuwatch_last" {
  repository = aws_ecr_repository.seiyuwatch.name

  policy = file("aws_ecr_lifecycle_policy/last.json")
}

resource "aws_ecr_lifecycle_policy" "whalebirdsocial_last" {
  repository = aws_ecr_repository.whalebirdsocial.name

  policy = file("aws_ecr_lifecycle_policy/last.json")
}

resource "aws_ecr_lifecycle_policy" "masudastream_last" {
  repository = aws_ecr_repository.masudastream.name

  policy = file("aws_ecr_lifecycle_policy/last.json")
}

resource "aws_ecr_lifecycle_policy" "pleroma_pohenix_last" {
  repository = aws_ecr_repository.pleroma_phoenix.name

  policy = file("aws_ecr_lifecycle_policy/last.json")
}

resource "aws_ecr_lifecycle_policy" "pleroma_nginx_last" {
  repository = aws_ecr_repository.pleroma_nginx.name

  policy = file("aws_ecr_lifecycle_policy/last.json")
}

resource "aws_ecr_lifecycle_policy" "pod_identity_webhook_last" {
  repository = aws_ecr_repository.pod_identity_webhook.name

  policy = file("aws_ecr_lifecycle_policy/last.json")
}
