################################################################################
# IAM Role Policy Attachment
################################################################################

variable "role" {
  description = "The name of the IAM role to which the policy should be applied"
  type        = string
  nullable    = false

  validation {
    condition     = length(trimspace(var.role)) > 0
    error_message = "The role name must not be empty."
  }
}

variable "policies" {
  description = "Policies to attach to the IAM role in `{'static_name' = 'policy_arn'}` format"
  type        = map(string)
  default     = {}

  validation {
    condition = alltrue([
      for arn in values(var.policies) :
      can(regex(
        "^arn:[^:]+:iam::[0-9]{12}:policy/.+$",
        arn
        )) || can(regex(
        "^arn:[^:]+:iam::aws:policy/.+$",
        arn
      ))
    ])
    error_message = "Each policy value must be an AWS-managed or customer-managed IAM policy ARN."
  }
}
