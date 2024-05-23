terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.76.0"
    }
  }

  backend "azurerm" {
    # subscription_id      = ""
    resource_group_name  = "terraform-resources"
    storage_account_name = "krtdevopsterraformprd"
    container_name       = "tfstate"
    # key                  = "cogna-sre-infra/azure/ingresso/shared/service-bus/terraform.tfstate"
    # access_key           = ""
  }

}
provider "azurerm" {
  # Configuration options
  features {}
  subscription_id            = var.sub_id[terraform.workspace]
  skip_provider_registration = true
}
