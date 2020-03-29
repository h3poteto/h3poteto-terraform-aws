resource "aws_iam_openid_connect_provider" "iam_role_sa" {
  url = "https://${data.terraform_remote_state.us.outputs.oidc_website_endpoint}"

  client_id_list = [
    data.terraform_remote_state.us.outputs.oidc_website_endpoint
  ]

  thumbprint_list = [
    data.external.thumb.result.thumbprint
  ]
}
