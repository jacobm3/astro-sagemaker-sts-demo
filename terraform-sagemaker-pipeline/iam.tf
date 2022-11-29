resource "aws_iam_role" "role" {
  name = "${var.project_prefix}-${random_string.suffix.id}-role"

  managed_policy_arns = [aws_iam_policy.sagemaker-to-s3.arn,
  "arn:aws:iam::aws:policy/AmazonSageMakerFullAccess"]
  max_session_duration = "3600"
  path                 = "/"

  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Condition": {},
      "Effect": "Allow",
      "Principal": {
        "Service": "sagemaker.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "sagemaker-to-s3" {
  name   = "${var.project_prefix}-${random_string.suffix.id}-sagemaker-to-s3-policy"
  path   = "/"
  policy = data.aws_iam_policy_document.sagemaker-to-s3.json
}

data "aws_iam_policy_document" "sagemaker-to-s3" {
  statement {
    effect = "Allow"
    actions = [
      "s3:*",
    ]
    resources = [
      "${aws_s3_bucket.bucket.arn}/*",
    ]
  }
}
