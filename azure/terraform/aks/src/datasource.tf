data "azurerm_resource_group" "rg_administrativo" {
  name = terraform.workspace == "HML" ? "rg-jornadaAdm-shared-us-hml" : "rg-administrativo-ksk-prd"
}

data "azurerm_user_assigned_identity" "identity" {
  name                = lower("ase-jornadaadm-identity-${terraform.workspace}")
  resource_group_name = data.azurerm_resource_group.rg_administrativo.name
}

data "azurerm_container_registry" "acr" {
  provider = azurerm.acr

  name                = "kdopacr"
  resource_group_name = "kdop"
}