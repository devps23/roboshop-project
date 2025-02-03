module "app" {
  source          = "./modules/app"
  components      = var.components
  instance_type   = var.instance_type
  zone_id         = var.zone_id
  subnets         = module.vpc.backend_subnets
  bastion_nodes   = var.bastion_nodes
}
module "vpc"{
  source                 = "./modules/vpc"
  availability_zone      = var.availability_zone
  backend_subnets        = var.backend_subnets
  default_route_table_id = var.default_route_table_id
  default_vpc_cidr_block = var.default_vpc_cidr_block
  default_vpc_id         = var.default_vpc_id
  env                    = var.env
  frontend_subnets       = var.frontend_subnets
  mysql_subnets          = var.mysql_subnets
  public_subnets         = var.public_subnets
  vpc_cidr_block         = var.vpc_cidr_block
}
# module "docdb"{
#   for_each             = var.docdb
#   source               = "./modules/docdb"
#   component            = each.value["docdb"]
#   env                  = var.env
#   subnets              = module.vpc.mysql_subnets
#   instance_count       = 1
#   instance_class       = each.value["instance_class"]
#   server_app_port_cidr = var.backend_subnets
#   kms_key_id           = each.value["kms_key_id"]
#   engine_version       = each.value["engine_version"]
# }
# module "rabbitmq" {
#   for_each                 = var.rabbitmq
#   source                   = "./modules/rabbitmq"
#   instance_type            = each.value["instance_type"]
#   subnets                  = module.vpc.mysql_subnets
#   vpc_id                   = module.vpc.vpc_id
#   component                = each.value["component"]
#   server_app_port_cidr     = var.backend_subnets
#   kms_key_id               = each.value["kms_key_id"]
#   env                      = var.env
# }
# module "reddis"{
#   for_each             = var.elasticache
#   source               = "./modules/elasticache"
#   server_app_port_cidr = var.backend_subnets
#   subnets              = module.vpc.mysql_subnets
#   component            = each.value["component"]
#   env                  = each.value["env"]
#   vpc_id               = module.vpc.vpc_id
#   family               = each.value["family"]
#   node_type            = each.value["node_type"]
#   engine_version       = each.value["engine_version"]
# }



