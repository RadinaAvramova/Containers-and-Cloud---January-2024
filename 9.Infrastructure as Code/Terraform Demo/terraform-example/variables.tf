variable "resource_group_name" {
  type = string
  description = "The name of the resource group"
}

variable "resource_group_location" {
   type = string
   description = "The name of the location group"
}

variable "app_service_plan_name" {
  type = string
  description = "The app service plan"
}

variable "app_service_name" {
    type = string
    description = "The app service name"
}

variable "sql_service_name" {
    type = string
    description = "The sql service name"
}

variable "sql_database_name" {
   type = string
   description = "The name of the database"
}

variable "sql_admin_login" {
    type = string
    description = "The username for the sql server"
}

variable "sql_admin_password" {
    type = string
    description = "The password for the sql user"
}

variable "firewall_rule_name" {
  type = string
  description = "The name of the firewall rule"
}

variable "repo_URL" {
    type = string
    description = "The URL of the Github repo"
}
