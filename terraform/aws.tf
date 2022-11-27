provider "aws" {
  region = "us-east-2"
  default_tags {
    tags = {
      Terraform = true
      Owner     = "jacob.martinson@astronomer.io"
    }
  }
}