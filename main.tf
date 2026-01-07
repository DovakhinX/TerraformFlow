#main.tf

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name = "terrapro-789"
  location = "westeurope"
}

resource "azurerm_storage_account" "storage" { 
  name = "terrapro7890" 
  resource_group_name = azurerm_resource_group.rg.name                             
  location = azurerm_resource_group.rg.location
  account_tier = "Standard"
  account_replication_type = "LRS"
  static_website {
   index_document = "index.html"
  }
}

resource "azurerm_storage_blob" "index" {
  name = "index.html"
  storage_account_name = azurerm_storage_account.storage.name
  storage_container_name = "$web"
  type = "Block"
  source = "index.html"
  content_type = "text/html"
}
