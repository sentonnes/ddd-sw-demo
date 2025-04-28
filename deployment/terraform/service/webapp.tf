provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "${local.service_name}-rg"
  location = "UK South"
}

resource "azurerm_service_plan" "plan" {
  name                = "${local.service_name}-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Linux"
  reserved            = true

  os_type  = "Linux"
  sku_name = "B1"
}

resource "azurerm_linux_web_app" "webapp" {
  name                = "${local.service_name}_webapp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    always_on        = true
  }

  app_settings = local.app_settings
}

resource "azurerm_linux_web_app_slot" "slot" {
  name           = "${local.service_name}-staging"
  app_service_id = azurerm_linux_web_app.webapp.id

  site_config {
    always_on        = true
  }

  app_settings = local.app_settings
}