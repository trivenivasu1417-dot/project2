terraform {
  backend "azurerm" {
    resource_group_name  = "demo-rg"
    storage_account_name = "demobackendtristore78921"
    container_name       = "tfstate"
    key                  = "dev.tfstate"
  }
}