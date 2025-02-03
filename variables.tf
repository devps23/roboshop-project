variable "instance_type"{}
variable "components"{
  default = ["frontend","Catalogue","User","Cart","Shipping","Payment","Dispatch"]
}
variable "zone_id" {}
variable "vault_token"{}
variable "vpc_cidr_block" {}
variable "default_vpc_id" {}
variable "default_vpc_cidr_block"{}
variable "default_route_table_id"{}
variable "frontend_subnets"{}
variable "backend_subnets" {}
variable "mysql_subnets" {}
variable "availability_zone" {}
variable "public_subnets"{}
variable "env"{}
variable "rabbitmq" {}
variable "kms_key_id" {}
variable "elasticache" {}
variable "docdb" {}
