# ------------------------------------------------------------------------------
# Web App and related resources
# ------------------------------------------------------------------------------

resource "azurerm_resource_group" "frontend" {
  name     = "rg-cars-web-prod-001"
  location = local.location
}

resource "azurerm_application_insights" "example" {
  name                = "appi-cars-web-prod-001"
  resource_group_name = azurerm_resource_group.frontend.name
  location            = local.location
  application_type    = "web"
}

resource "azurerm_service_plan" "frontend" {
  name                = "asp-cars-web-prod-001"
  resource_group_name = azurerm_resource_group.frontend.name
  location            = local.location
  os_type             = "Linux"
  sku_name            = "P0v3"
}

resource "azurerm_linux_web_app" "frontend" {
  name                = "app-cars-web-prod-001"
  resource_group_name = azurerm_resource_group.frontend.name
  location            = local.location
  service_plan_id     = azurerm_service_plan.frontend.id

  app_settings = {
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = "false"
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.example.instrumentation_key
  }

  site_config {
    always_on        = true
    app_command_line = "node server.js"

    application_stack {
      node_version = "20-lts"
    }
  }
}

# ------------------------------------------------------------------------------
# Deployment slots
# ------------------------------------------------------------------------------

resource "azurerm_linux_web_app_slot" "frontend_slots" {
  for_each       = local.slots
  name           = each.value.name
  app_service_id = azurerm_linux_web_app.frontend.id

  app_settings = {
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = "false"
  }

  site_config {
    always_on        = try(each.value.always_on, false)
    app_command_line = "node server.js"

    application_stack {
      node_version = "20-lts"
    }
  }
}

# ------------------------------------------------------------------------------
# Custom domain and SSL
# ------------------------------------------------------------------------------

resource "azurerm_app_service_custom_hostname_binding" "frontend" {
  hostname            = local.hostname
  app_service_name    = azurerm_linux_web_app.frontend.name
  resource_group_name = azurerm_resource_group.frontend.name
}

resource "azurerm_app_service_managed_certificate" "frontend" {
  custom_hostname_binding_id = azurerm_app_service_custom_hostname_binding.frontend.id
}

resource "azurerm_app_service_certificate_binding" "frontend" {
  hostname_binding_id = azurerm_app_service_custom_hostname_binding.frontend.id
  certificate_id      = azurerm_app_service_managed_certificate.frontend.id
  ssl_state           = "SniEnabled"
}
