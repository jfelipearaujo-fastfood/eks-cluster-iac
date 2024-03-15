data "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

resource "aws_iam_policy" "bucket_policy" {
  name        = "${var.bucket_name}-policy"
  description = "Policy for the S3 bucket"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ],
        Resource = "${data.aws_s3_bucket.bucket.arn}/app/images*",
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "bucket_policy_attachment" {
  role       = var.role_name
  policy_arn = aws_iam_policy.bucket_policy.arn
}
