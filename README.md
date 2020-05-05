# routetable
Route table creation with subnet association. Cross subscription routing from a spoke to the hub

# Steps

1. Clone repo to local machine
1. Update variables.tf with new values
1. Update main.tf with backend details
1. Setup service connection for AzureDevops pipeline

# Use

2. Calling the module;

```terraform
provider "azurerm" {
    version         = "~> 1.41"
    alias           = "src"
    subscription_id = var.SubscriptionId
}

provider "azurerm" {
    version         = "~> 1.41"
    alias           = "dst"
    subscription_id = var.SubscriptionId
}

module "create" {
    source        = "github.com/ukho/tfmodule-azure-routetable-hub-spoke"
    providers     = {
                      azurerm.hub   = "azurerm.dst" # Provider defined above (dst) is mapped to a provider (hub) in the module
                      azurerm.spoke = "azurerm.src"
                    }
    spokerg       =  var.spokerg
    hubrg         =  var.hubrg
    hubrt         =  var.hubrt
    id            =  var.id
    routetable    =  var.routetable
    routeaddress  =  var.routeaddress
    route         =  var.route
    hop           =  var.hop
    api           =  var.api
    nsb           =  var.nsb
    web           =  var.web
    hubprefix     =  var.hubprefix
    spokeprefix   =  var.spokeprefix 
}
```
