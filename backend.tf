terraform {
  backend "s3" {
    bucket = "batch10-dev-tf-state-bucket"
    key = "main"
    region = "ap-south-1"
    dynamodb_table = "batch10-dynamo-table"
  }
}
