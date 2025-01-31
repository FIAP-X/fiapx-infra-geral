variable "aws_region" {
  description = "Região da AWS"
  type        = string
  default     = "us-east-1"
}

variable "bucket_upload_name" {
  description = "Nome do bucket S3 de upload de vídeos"
  type        = string
}

variable "bucket_processed_name" {
  description = "Nome do bucket S3 de imagens processadas"
  type        = string
}