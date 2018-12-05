# h3poteto-terraform-aws
This is terraform definition for my infrastructers on AWS.

## Install
Please use `tfenv`, and

```bash
$ git clone git@github.com:h3poteto/h3poteto-terraform-aws.git
$ cd h3poteto-terraform-aws
$ tfenv install
```

## Usage

Please prepare `secret.tf` for each tfstate and you can refer `secret.tf.sample`.

For example:

```bash
$ cd aws-accounts/iam
$ cp secret.tf.sample secret.tf
```

```bash
$ cd aws-accounts/iam
$ terraform init
$ terraform plan
```

