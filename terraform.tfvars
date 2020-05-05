resource_prefix             = "web-server"
web_server_location         = "westeurope"
web_server_rg               = "web-rg"
web_server_address_space    = "10.0.0.0/22"
web_server_name             = "web"
environment                 = "development"
web_server_count            =  2
web_server_subnets          = {
    web-server              = "10.0.1.0/24"
    AzureBastionSubnet      = "10.0.2.0/24"
}