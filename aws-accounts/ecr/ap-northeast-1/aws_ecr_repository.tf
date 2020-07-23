resource "aws_ecr_repository" "fascia" {
  name = "h3poteto/fascia"
}

resource "aws_ecr_repository" "seiyuwatch" {
  name = "h3poteto/seiyuwatch"
}

resource "aws_ecr_repository" "whalebirdsocial" {
  name = "h3poteto/whalebirdsocial"
}

resource "aws_ecr_repository" "masudastream" {
  name = "h3poteto/masudastream"
}

resource "aws_ecr_repository" "pleroma_phoenix" {
  name = "h3poteto/pleroma/phoenix"
}

resource "aws_ecr_repository" "pleroma_nginx" {
  name = "h3poteto/pleroma/nginx"
}

resource "aws_ecr_repository" "pod_identity_webhook" {
  name = "eks/pod-identity-webhook"
}
