resource "aws_s3_bucket" "bucket_upload" {
  bucket = var.bucket_upload_name
}

resource "aws_s3_bucket" "bucket_processed" {
  bucket = var.bucket_processed_name
}