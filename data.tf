# This data block will query Azure for the Enrollment Account to place the subscription within.
data "azurerm_billing_enrollment_account_scope" "enrollment" {
  billing_account_name    = var.billing_account_number
  enrollment_account_name = var.enrollment_account_name
}

# This data block will only fire if a management group name is passed into the management_group_name variable
# If the variable is not null, this block will query azure for the management group
# This is used in the management group subscription association resource in main.tf
data "azurerm_management_group" "mgmt_group" {
  count = var.management_group_name != null ? 1 : 0
  name  = var.management_group_name
}
