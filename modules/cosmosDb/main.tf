resource "random_integer" "ri" {
  min = 10000
  max = 99999
}
resource "azurerm_cosmosdb_account" "demoCosmos" {
  name                = "demo-cosmos-db-${random_integer.ri.result}"
  location            = "UK south"
  resource_group_name = "demoVani"
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  enable_automatic_failover = true

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 10
    max_staleness_prefix    = 200
  }

  geo_location {
    location          = "UK west"
    failover_priority = 1
  }

  geo_location {
    prefix            = "demobackup-cosmos-db-${random_integer.ri.result}"
    location          = "demoVani"
    failover_priority = 0
  }
}
