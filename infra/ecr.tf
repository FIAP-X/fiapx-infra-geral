resource "aws_ecr_repository" "fiapx_apiprocessamento" {
  name                 = "fiapx-apiprocessamento"
  image_tag_mutability = "MUTABLE" 
  lifecycle {
    ignore_changes = [image_tag_mutability]
  }
}