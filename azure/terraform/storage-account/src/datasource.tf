data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "rg_ingresso" {
  name = lower("${var.rg_name[terraform.workspace]}")
}

