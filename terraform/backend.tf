terraform {
  backend "s3" {
    bucket  = "onefootball-terraform-state"
    region  = "eu-central-1"
    encrypt = false
  }
}
