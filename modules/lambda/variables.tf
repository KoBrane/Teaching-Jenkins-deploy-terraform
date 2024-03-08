variable "bucket_name" {
  description = "Name of Bucket"
  type = string
}

variable "bucket_arn" {
  description = "arn of the s3 bucket for incoming requests"
  type = string
}

variable "filter_name" {
    description = "filter prefix for s3 objects incoming email requests"
    type = string
}

variable "lambda_handler_name" {
    type = string
    description = "Lambda handler"
    default = "lambda.lambda_hnadler"
}

variable "folder_name" {
  description = "folder for s3 objects incoming email requests"
  type = string
}

variable "function_prefix" {
    type = string
    description = "lambda function prefix for s3 objects incoming email requests"
    default = "processed-email"
}

variable "policy_attachment_name" {
    type = string
    description = "IAM policy name for Lambda"
    default = "lambda-execution-for-s3"
}

variable "filter_prefix" {
    type = string
    description = "(optional) describe your variable"
}