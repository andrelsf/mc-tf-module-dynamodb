# Terraform Module AWS SQS

Multicode Terraform module AWS DynamoDB

## Using the module

1. Simple example of using the module

```hcl
module "dynamodb" {
  source                      = "git::https://github.com/andrelsf/mc-tf-module-dynamodb.git?ref=1.0.0"
  
}
```

2. Add the AWS provider

Example:

```hcl
provider "aws" {
  region                   = "us-east-1"
  profile                  = "default"
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
}
```

## Referencies

- [Terraform AWS SQS Queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue)