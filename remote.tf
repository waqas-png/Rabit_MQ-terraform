terraform {
  backend "s3" {
    bucket         = "terraform-s3-state-rabitt-mq"       # Replace with your S3 bucket name
    key            = "terraform/state/terraform.tfstate"   # Path within the bucket
    region         = "us-east-2"                  # AWS region of the S3 bucket
    encrypt        = true                         # Optional: enable server-side encryption
  }
}
