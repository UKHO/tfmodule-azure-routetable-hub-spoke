# routetable hub to spoke
Route table creation with subnet association. Cross subscription routing from a spoke to the hub

## Use

```terraform
provider "azurerm" {
  version = "=2.20.0"
  features {}
  alias           = "hub"
  subscription_id = var.hub_sub_Id
}
provider "azurerm" {
  version = "=2.20.0"
  features {}
  alias           = "spoke"
  subscription_id = local.spoke_sub_id
}

module "create" {
    source                  = "github.com/ukho/tfmodule-azure-routetable-hub-spoke?ref=0.3.0"
    providers = {
        azurerm.hub   = azurerm.hub
        azurerm.spoke = azurerm.spoke
    }    
    spokesubscriptionid     =  var.spoke_sub_id
    hubsubscriptionid       =  var.hub_sub_id
    spokerg                 =  var.spokerg
    hubrg                   =  var.hubrg
    hubrt                   =  var.hubrt
    id                      =  var.id
    routetable              =  var.routetable
    routeaddress            =  var.routeaddress
    route                   =  var.route
    hop                     =  var.hop
    subnets                 =  var.SUBNETS
    hubprefix               =  var.hubprefix
    spokeprefix             =  var.spokeprefix 
}
```

`id`: Identity of project, this is used to build up elements like the vnet

`subnets` is an array of subnets, if you have been using the tfmodule for our vnet and nsg setup, it is the same object.
