resource "aws_sqs_queue" "sqs_processamento_dlq" {
  name = "fiapx-sqs-processamento-dlq"
}

resource "aws_sqs_queue" "sqs_processamento" {
  name = "fiapx-sqs-processamento"

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.sqs_processamento_dlq.arn
    maxReceiveCount     = 3
  })
}

resource "aws_sqs_queue_policy" "sqs_processamento_policy" {
  queue_url = aws_sqs_queue.sqs_processamento.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "s3.amazonaws.com"
        }
        Action    = "sqs:SendMessage"
        Resource  = aws_sqs_queue.sqs_processamento.arn
        Condition = {
          ArnLike = {
            "aws:SourceArn" = "arn:aws:s3:::${aws_s3_bucket.bucket_upload.bucket}"
          }
        }
      }
    ]
  })
}