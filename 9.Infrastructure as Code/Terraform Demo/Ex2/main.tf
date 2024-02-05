# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.89.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Generate random integer to create a globally unique name
resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

# Create the resource group
resource "azurerm_resource_group" "rg" {
    name = "ContactBookRG-${random_integer.ri.result}"
    location = "West Europe"
}

# Create the Linux App Service Plan
resource "azurerm_service_plan" "asp" {
  name                = "contact-book-service-plan-${random_integer.ri.result}"
  resource_group_name = azurerm_resource_group.rg.location
  location            = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "F1"
}

# Create the web app, pass in the App Service Plan ID
resource "azurerm_linux_web_app" "alwa" {
  name                = "contact-book-webapp-${random_integer.ri.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.asp.location
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    application_stack {
      node_version = "16-lts"
    }

    always_on = false
  }
}

# Deploy code from a public github repo
resource "azurerm_app_service_source_control" "github" {
  app_id = azurerm_linux_web_app.alwa.id
  repo_url = "https://github.com/nakov/ContactBook"
  branch = "master"
  use_manual_integration = true
}