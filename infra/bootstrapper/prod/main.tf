module "azure-DEV-DEVEX_core_values" {
  source  = "pagopa-dx/azure-core-values-exporter/azurerm"
  version = "~> 0.0"

  providers = {
    azurerm = azurerm.DEV-DEVEX
  }

  core_state = {
    resource_group_name  = "md-p-itn-tfstate-rg-01"
    storage_account_name = "mdpitntfstatest01"
    subscription_id      = "35e6e3b2-4388-470e-a1b9-ad3bc34326d1"
    container_name       = "terraform-state"
    key                  = "md.core.prod.tfstate"
  }
}

module "azure-DEV-DEVEX_bootstrap" {
  source  = "pagopa-dx/azure-github-environment-bootstrap/azurerm"
  version = "~> 3.0"

  providers = {
    azurerm = azurerm.DEV-DEVEX
  }

  environment = merge(local.environment, local.azure_accounts.DEV-DEVEX)

  subscription_id = module.azure-DEV-DEVEX_core_values.subscription_id
  tenant_id       = module.azure-DEV-DEVEX_core_values.tenant_id

  entraid_groups = {
    admins_object_id    = data.azuread_group.admins.object_id
    devs_object_id      = data.azuread_group.developers.object_id
    externals_object_id = data.azuread_group.externals.object_id
  }

  terraform_storage_account = {
    name                = "mdpitntfstatest01"
    resource_group_name = "md-p-itn-tfstate-rg-01"
  }

  repository = {
    owner = "pagopa"
    name  = "dx"
  }

  github_private_runner = {
    container_app_environment_id       = module.azure-DEV-DEVEX_core_values.github_runner.environment_id
    container_app_environment_location = local.azure_accounts.DEV-DEVEX.location
    labels = [
      "prod"
    ]
    key_vault = {
      name                = module.azure-DEV-DEVEX_core_values.common_key_vault.name
      resource_group_name = module.azure-DEV-DEVEX_core_values.common_key_vault.resource_group_name
    }
  }

  pep_vnet_id                        = module.azure-DEV-DEVEX_core_values.common_vnet.id
  private_dns_zone_resource_group_id = module.azure-DEV-DEVEX_core_values.network_resource_group_id
  opex_resource_group_id             = module.azure-DEV-DEVEX_core_values.opex_resource_group_id

  tags = local.tags
}