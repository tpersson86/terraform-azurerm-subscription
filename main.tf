# This resource block creates the subscription within the enrollment specified
resource "azurerm_subscription" "sub" {
  subscription_name = var.subscription_name
  billing_scope_id  = data.azurerm_billing_enrollment_account_scope.enrollment.id
  tags              = var.tags
}

# This resource block will assocaite the subscription to a management group,
# if the management_group_name variable is not null, and the data query was 
# able to aquire the management group resource from azure.
resource "azurerm_management_group_subscription_association" "sub_to_mgmt_grp_association" {
  count               = var.management_group_name != null ? 1 : 0
  management_group_id = data.azurerm_management_group.mgmt_group[0].id
  subscription_id     = "subscriptions/${azurerm_subscription.sub.subscription_id}"
}
