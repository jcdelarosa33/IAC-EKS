resource "aws_s3_bucket" "tfstate_bucket" {
  bucket = "jc-tfstate-backend"
}


resource "aws_s3_bucket_versioning" "enable_versioning" {
  bucket = aws_s3_bucket.tfstate_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "lock-state-table" {
  name           = "terraform-state"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}