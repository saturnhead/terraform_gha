terraform {
  required_version = "=1.5.7"

  backend "s3" {
    bucket = "saturnhead-state-bucket"
    key    = "terraform/ec2_gha.tfstate"
    region = "eu-west-1"
  }
}
