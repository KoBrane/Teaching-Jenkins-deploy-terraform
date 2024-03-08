## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | n/a |
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.lambda_execution_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_lambda_function.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_permission.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_notification.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_notification) | resource |
| [archive_file.this](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_arn"></a> [bucket\_arn](#input\_bucket\_arn) | arn of the s3 bucket for incoming requests | `string` | n/a | yes |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Name of Bucket | `string` | n/a | yes |
| <a name="input_filter_name"></a> [filter\_name](#input\_filter\_name) | filter prefix for s3 objects incoming email requests | `string` | n/a | yes |
| <a name="input_filter_prefix"></a> [filter\_prefix](#input\_filter\_prefix) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_folder_name"></a> [folder\_name](#input\_folder\_name) | folder for s3 objects incoming email requests | `string` | n/a | yes |
| <a name="input_function_prefix"></a> [function\_prefix](#input\_function\_prefix) | lambda function prefix for s3 objects incoming email requests | `string` | `"processed-email"` | no |
| <a name="input_lambda_handler_name"></a> [lambda\_handler\_name](#input\_lambda\_handler\_name) | Lambda handler | `string` | `"lambda.lambda_hnadler"` | no |
| <a name="input_policy_attachment_name"></a> [policy\_attachment\_name](#input\_policy\_attachment\_name) | IAM policy name for Lambda | `string` | `"lambda-execution-for-s3"` | no |

## Outputs

No outputs.
