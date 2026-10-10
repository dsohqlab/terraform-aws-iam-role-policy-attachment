# terraform-aws-iam-role-policy-attachment

Terraform module to attach managed IAM policies to an IAM role.

## Usage

To attach AWS-managed or customer-managed IAM policies to an existing IAM role:

```hcl
module "iam-role-policy-attachment" {
  source  = "dsohqlab/iam-role-policy-attachment/aws"
  version = "~> 1.0.0"

  role = "application-role"

  policies = {
    s3_read_only = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
    cloudwatch   = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.11.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.28 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.68.0 |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_policies"></a> [policies](#input\_policies) | Policies to attach to the IAM role in `{'static_name' = 'policy_arn'}` format | `map(string)` | `{}` | no |
| <a name="input_role"></a> [role](#input\_role) | The name of the IAM role to which the policy should be applied | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
