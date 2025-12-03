terraform {
  backend "s3" {
    bucket         = "clinicops-tfstate-cd194a41"
    key            = "clinicops/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "clinicops-tf-lock"
    encrypt        = true
  }
}
