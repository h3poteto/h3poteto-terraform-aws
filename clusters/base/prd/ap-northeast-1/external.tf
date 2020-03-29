data "external" "thumb" {
  program = ["kubergrunt", "eks", "oidc-thumbprint", "--issuer-url", "https://${data.terraform_remote_state.us.outputs.oidc_website_endpoint}"]
}
