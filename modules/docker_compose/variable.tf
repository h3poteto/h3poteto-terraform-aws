variable "service" {}

variable "env" {}

variable "tfstate" {}

variable "key_name" {}

variable "vpc_id" {}

variable "subnet_id" {}

variable "instance_profile_name" {}

variable "ami_id" {
  default = {
    ap-northeast-1 = "ami-1bfdb67c" # ubuntu16.04 LTS
  }
}

variable "instance_type" {}

variable "volume_size" {}

variable "operation_ip_addresses" {
  type = "list"
}

# EC2インスタンスを追加で既存のSecurityGroupにも所属させる場合に指定する
variable "sub_security_group_ids" {
  type = "list"
}

variable "compose_version" {}

variable "env_bucket_path" {}

variable "kms_key_id" {}

variable "custom_commands" {}
