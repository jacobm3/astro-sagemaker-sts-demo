resource "aws_s3_bucket" "bucket" {
  bucket        = "${var.project_prefix}-${random_string.suffix.id}-bucket"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "bucket" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Disabled"
  }
}