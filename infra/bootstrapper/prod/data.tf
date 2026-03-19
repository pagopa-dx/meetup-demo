data "azuread_group" "admins" {
  display_name = "dx-p-adgroup-admin"
}

data "azuread_group" "developers" {
  display_name = "dx-p-adgroup-developers"
}

data "azuread_group" "externals" {
  display_name = "dx-p-adgroup-externals"
}
