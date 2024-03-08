resource "aws_iam_role" "this" {
  name = "${var.function_prefix}-role"

  assume_role_policy = jsonencode({
    version = "2012-10-17"
    statement = [
        {
            Action = "sts:AssumeRole",
            Effect = "Allow",
            Principal = {
                service = "lambda.amazonaws.com"
            }
        }
    ]
  })
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}


resource "aws_iam_policy" "this" {
    name = "${var.function_prefix}-policy"
    path = "/"
    description = "IAM lambda policy for processing emails"

    policy = jsonencode(
        {
            Version: "2012-10-17"
            Statement : [
                {
                    Effect : "Allow",
                    Action : [
                        "logs:CreateLogGroup",
                        "log:CreateLogStream",
                        "logs:PutLogEvents"
                    ],
                    Resource : "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/${aws_lambda_function.this.function_name}:*"
                },
                {
                    Effect : "Allow",
                    Action : [
                        "s3:GetObject",
                        "s3:PutObject",   
                    ],
                    Resource : "arn:aws:s3:::${var.bucket_name}/*"
                }
            ]
        }
    )
}

resource "aws_lambda_function" "this" {
    filename = "./tmp/lambda.zip"
    function_name = "${var.function_prefix}-lambda"
    role = aws_iam_role.this.arn
    handler = var.lambda_handler_name

    runtime = "python3.12"

    environment {
      variables = {
        BUCKET_NAME = var.bucket_name
        PROCESSED_EMAILS_FOLDER = var.folder_name
        MAIN_EMAILS_FOLDER   = var.filter_prefix
      }
    }
}


resource "aws_lambda_permission" "this" {
  statement_id = "AllowExecutionFromS3Bucket"
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal = "s3.amazonaws.com"

  source_arn = aws_s3_bucket.this.arn
}

resource "aws_s3_bucket_notification" "this" {
  bucket = var.bucket_name

  lambda_function {
    lambda_function_arn = aws_lambda_function.this.arn
    events = ["s3:ObjectCreated:*"]
    filter_prefix = var.filter_prefix
  }
}

resource "aws_iam_policy_attachment" "lambda_execution_policy" {
  name = var.policy_attachment_name
  policy_arn = aws_iam_policy.this.arn
  roles = [aws_iam_role.this.name]
}


data "archive_file" "this" {
    type = "zip"
    source_dir = "${path.module}/Functions"
    output_path = "./tmp/lambda.zip"
    excludes = ["./*.zip"]
}