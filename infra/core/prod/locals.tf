locals {
  environment = {
    prefix          = "md"
    env_short       = "p"
    domain          = ""
    instance_number = "01"
  }

  azure_accounts = {
    DEV-DEVEX = {
      location = "italynorth"
    }
  }

  tags = {
    CreatedBy      = "Terraform"
    Environment    = "prod"
    CostCenter     = "TS000"
    BusinessUnit   = "DevEx"
    ManagementTeam = "DeveloperExperience"
  }
}