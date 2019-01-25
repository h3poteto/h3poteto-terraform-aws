output "kubeconfig" {
  value = "${data.template_file.kubeconfig.rendered}"
}

output "eksconfig" {
  value = "${data.template_file.eksconfig.rendered}"
}
