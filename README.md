# Terraform on Azure
> Terraform v12 using v2 of Azure provider to provision a multi-location web service.

## Prerequisites
* Azure subscription
* Azure CLI
* Terraform
* Create Azure resource group **remote-state** and storage account **terraformstatesud** to store remote state
* Create a Key valut in resource group **remote-state** with name **webserver-vault** and create a secret with name **admin-password** which contains VM password

## To provision web servers
``` bash
az login
cd web
terraform init
terraform apply
```

## To provision bastion
``` bash
cd bastion
terraform init
terraform apply
```

## To destroy resources
``` bash
cd bastion
terraform destroy
cd web
terraform destroy
```
