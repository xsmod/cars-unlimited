# ------------------------------------------------------------------------------
# Identity and access management for GitHub Actions
# ------------------------------------------------------------------------------

resource "azurerm_resource_group" "identity" {
  name     = "rg-cars-identity-prod-001"
  location = local.location
}

resource "azurerm_user_assigned_identity" "github_actions" {
  location            = azurerm_resource_group.identity.location
  name                = "id-github-actions-001"
  resource_group_name = azurerm_resource_group.identity.name
}

resource "azurerm_role_assignment" "github_actions_owner" {
  scope                = azurerm_resource_group.frontend.id
  role_definition_name = "Owner"
  principal_id         = azurerm_user_assigned_identity.github_actions.principal_id
}
