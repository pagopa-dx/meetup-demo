module "azure-DEV-DEVEX_core" {
  source  = "pagopa-dx/azure-core-infra/azurerm"
  version = "~> 3.0"

  providers = {
    azurerm = azurerm.DEV-DEVEX
  }

  environment = merge(local.environment, local.azure_accounts.DEV-DEVEX, {
    app_name = "core"
  })

  tags = local.tags
}
