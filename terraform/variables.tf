### For network

variable "location" {
  type    = string
  default = "North Central US"
}

variable "resource_group_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type    = list(string)
  default = ["10.20.0.0/16"]
}

variable "web_subnet_name" {
  type    = string
  default = "snet-web"
}

variable "web_subnet_address" {
  type    = string
  default = "10.20.10.0/24"
}

variable "app_subnet_name" {
  type    = string
  default = "snet-app"
}

variable "app_subnet_address" {
  type    = string
  default = "10.20.20.0/24"
}

variable "data_subnet_name" {
  type    = string
  default = "snet-data"
}

variable "data_subnet_address" {
  type    = string
  default = "10.20.30.0/24"
}

variable "management_subnet_name" {
  type    = string
  default = "snet-management"
}

variable "management_subnet_address" {
  type    = string
  default = "10.20.40.0/24"
}

variable "web_nsg_name" {
  type    = string
  default = "nsg-web"
}

variable "app_nsg_name" {
  type    = string
  default = "nsg-app"
}

variable "data_nsg_name" {
  type    = string
  default = "nsg-data"
}

variable "management_nsg_name" {
  type    = string
  default = "nsg-management"
}

variable "web_vm_name" {
  type = string
}

variable "data_vm_name" {
  type = string
}

variable "web_vm_size" {
  type    = string
  default = "Standard_B1s"
}

variable "data_vm_size" {
  type    = string
  default = "Standard_B1s"
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "web_nic_name" {
  type    = string
  default = "nic-web-01"
}

variable "data_nic_name" {
  type    = string
  default = "nic-data-01"
}

variable "web_public_ip_name" {
  type    = string
  default = "pip-web-01"
}

variable "app_service_plan_name" {
  type = string
}

variable "app_service_name" {
  type = string
}

variable "environment" {
  type    = string
  default = "Lab"
}

variable "project_name" {
  type    = string
  default = "HybridCloudLab"
}

variable "owner" {
  type    = string
  default = "Zamir"
}

variable "managed_by" {
  type    = string
  default = "Terraform"
}


### For security
variable "allowed_ssh_cidr" {
  type        = string
  description = "Public IP allowed to SSH into the web VM"
}

### For compute
variable "ssh_public_key_path" {
  type = string
}
