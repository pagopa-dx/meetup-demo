data "azuread_group" "admins" {
  display_name = "md-p-adgroup-admin"
}

data "azuread_group" "developers" {
  display_name = "md-p-adgroup-developers"
}

data "azuread_group" "externals" {
  display_name = "md-p-adgroup-externals"
}