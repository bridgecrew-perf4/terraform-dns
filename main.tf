terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.31.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }

  backend "remote" {
    organization = "kwiniaskaridge"

    workspaces {
      name = "dns"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

module "kms" {
  source = "./kms"
}

module "zones" {
  for_each = toset(var.tlds)
  source   = "./zone"
  name     = "${var.base-zone}.${each.key}"
  kms-key  = module.kms.key
}

module "org-email" {
  source      = "./email"
  hosted-zone = module.zones["org"].hosted-zone
}
