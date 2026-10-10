module "iam_policy_attachments" {
  source = "../.."

  role = "application-role"

  policies = {
    s3_read_only = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
    cloudwatch   = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  }
}
