# Terraform on Azure
> Terraform v12 using v2 of Azure provider to provision a multi-location web service.

## Prerequisites
* Azure subscription
* Azure CLI
* Terraform
* Create a Key valut in Azure with name **webserver-vault** and create a secret with name **admin-password** which contains VM password

## To provision resources
``` bash
az login
terraform init
terraform apply
```

## To destroy resources
``` bash
terraform destroy
```
