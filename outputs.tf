output "this_aws_dynamodb_table_id" {
  description = "DynamoDB Table ID"
  value       = aws_dynamodb_table.this.id
}

output "this_aws_dynamodb_table_name" {
  description = "DynamoDB Table name"
  value       = aws_dynamodb_table.this.name
}

output "this_aws_dynamodb_table_arn" {
  description = "DynamoDB Table ARN"
  value       = aws_dynamodb_table.this.arn
}

output "this_aws" {
  description = "DynamoDB Table Stream ARN"
  value = aws_dynamodb_table.this.stream_arn
}