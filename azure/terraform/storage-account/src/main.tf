resource "azurerm_storage_account" "storage_account" {
  name                     = lower("${var.storage_name}${terraform.workspace}")
  resource_group_name      = data.azurerm_resource_group.rg_ingresso.name
  location                 = data.azurerm_resource_group.rg_ingresso.location
  account_tier             = var.storage_tier
  account_replication_type = var.storage_replication
  access_tier              = var.storage_acccess
  account_kind             = var.storage_kind
  min_tls_version          = var.storage_tls_version

  static_website {
    index_document = "index.html"
  }

  tags = local.tag_values
}

resource "azurerm_storage_blob" "blob" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source                 = "view/index.html"
}
