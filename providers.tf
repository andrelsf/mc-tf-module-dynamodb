terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.25.0"
    }
  }
}
provider "aws" {
  profile                  = "default"
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  default_tags {
    tags = {
      owner      = "Multicode"
      email      = "andre.ferreira@multicode.dev.br"
      managed-by = "terraform"
    }
  }
}