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

variable "subnet_ids" {
  description = "Lista de IDs das subnets"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}