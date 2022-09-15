terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "<=3.74.1"
    }
    template = {
        source = "hashicorp/template"
        version = "2.1.0"
    }
    tls = {
        source = "hashicorp/tls"
        version = "2.1.0"
    }
  }
  required_version = ">=0.13"
}