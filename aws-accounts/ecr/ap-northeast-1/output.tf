output "fascia_url" {
  value = "${aws_ecr_repository.fascia.repository_url}"
}

output "seiyuwatch_url" {
  value = "${aws_ecr_repository.seiyuwatch.repository_url}"
}

output "whalebirdorg_url" {
  value = "${aws_ecr_repository.whalebirdorg.repository_url}"
}

output "masudastream_url" {
  value = "${aws_ecr_repository.masudastream.repository_url}"
}

output "pleroma_phoenix_url" {
  value = "${aws_ecr_repository.pleroma_phoenix.repository_url}"
}

output "pleroma_nginx_url" {
  value = "${aws_ecr_repository.pleroma_nginx.repository_url}"
}
