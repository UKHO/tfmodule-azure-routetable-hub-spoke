# routetable hub to spoke
Route table creation with subnet association. Cross subscription routing from a spoke to the hub

## Use

```terraform
module "create" {
    source                  = "github.com/ukho/tfmodule-azure-routetable-hub-spoke?ref=0.2.0"
    spokesubscriptionid     =  var.spokesubscriptionid
    hubsubscriptionid       =  var.hubsubscriptionid
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

`subnets` is an array of subnets, if you have been using the tfmodule for our vnet and nsg setup, it is the same object.
