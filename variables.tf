# Module Variables
variable "subscription_name" {
  type        = string
  description = "Name of the subscription deployed by this module."
}

variable "subscription_workload" {
  type        = string
  description = "Tytpe of workload to classify this subscription. Available options are 'Produciton' and 'DevTest'."
  default     = "Production"

  validation {
    condition     = var.subscription_workload == "Production" || var.subscription_workload == "DevTest"
    error_message = "Please enter either 'Produciton' or 'DevTest'."
  }
}

variable "billing_account_number" {
  type        = string
  description = "Billing account name for the Enrollment."
}

variable "enrollment_account_name" {
  type        = string
  description = "Enrollment name. This should be the enrollment ID from the EA Portal."
}

variable "management_group_name" {
  type        = string
  description = "Enter a management group name to associate the new subscription to."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Additional default tags to add to the resources being deployed at this layer"
  default     = {}
}
