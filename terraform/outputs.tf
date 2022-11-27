output "bucket_arn" { value = aws_s3_bucket.bucket.arn }
output "bucket_id" { value = aws_s3_bucket.bucket.id }

output "sagemaker_role_arn" { value = aws_iam_role.role.arn }
output "sagemaker_role_name" { value = aws_iam_role.role.name }

