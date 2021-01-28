module "h3poteto_production_kms" {
  source     = "../../modules/kms"
  key_name   = "h3poteto-production"
  account_id = var.account_id
}


module "ci_kms" {
  source     = "../../modules/kms"
  key_name   = "ci-kms"
  account_id = var.account_id
}
