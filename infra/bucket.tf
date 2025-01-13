resource "aws_s3_bucket" "bucket_upload" {
  bucket = var.bucket_upload_name
}

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {
  bucket = aws_s3_bucket.bucket_upload.id

  rule {
    id     = "delete-old-objects"
    status = "Enabled"

    expiration {
      days = 1
    }

    filter {}
  }
}

resource "aws_s3_bucket" "bucket_processed" {
  bucket = var.bucket_processed_name
}