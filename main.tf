terraform {
  required_version = "~> 1.10"
  backend "azurerm" {
    storage_account_name = "andrzejtfstate7711"     # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "prod.terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }

  required_providers {
    # azurerm = {
    #   source  = "hashicorp/azurerm"
    #   version = "~> 4.32"
    # }
    # azuread = {
    #   source  = "hashicorp/azuread"
    #   version = "~> 3.4"
    # }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
    # http = {
    #   source  = "hashicorp/http"
    #   version = "~> 3.5"
    # }
  }
}

resource "random_string" "number" {
  length      = 8
  min_numeric = 8
}

output "random_number" {
  value = random_string.number.result
}
