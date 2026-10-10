################################################################################
# IAM Role Policy Attachment
################################################################################

resource "aws_iam_role_policy_attachment" "this" {
  for_each = var.policies

  policy_arn = each.value
  role       = var.role
}
