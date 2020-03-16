provider "azurerm" {
    version = "~>1.5" 
    
}

terraform {
    backend "azurerm" {}
}
resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "democluster"
  location            = "UK SOUTH"
  resource_group_name = "demoVani"
  dns_prefix          = "exampleaks1"
  
  service_principal {
    client_id     = "14dd879f-7915-48a7-9ca0-83d2bfb27072"
    client_secret = "3b532d5c-8532-47ce-b5d8-42669a045579"
  }
  default_node_pool {
    name            = "default"
    node_count           = "1"
    vm_size         = "Standard_DS1_v2"
    
  }
  tags = {
        Environment = "Development"
    }

}
