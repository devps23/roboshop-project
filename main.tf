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
module "docdb"{
  for_each             = var.docdb
  source               = "./modules/docdb"
  component            = each.value["component"]
  env                  = var.env
  subnets              = module.vpc.mysql_subnets
  instance_count       = 1
  instance_class       = each.value["instance_class"]
  server_app_port_cidr = var.backend_subnets
  kms_key_id           = each.value["kms_key_id"]
  engine_version       = each.value["engine_version"]
  family               = each.value["family"]
  vpc_id               = module.vpc.vpc_id
}
module "rabbitmq" {
  for_each                 = var.rabbitmq
  source                   = "./modules/rabbitmq"
  instance_type            = each.value["instance_type"]
  subnets                  = module.vpc.mysql_subnets
  vpc_id                   = module.vpc.vpc_id
  component                = each.value["component"]
  server_app_port_cidr     = var.backend_subnets
  kms_key_id               = each.value["kms_key_id"]
  env                      = var.env
  bastion_nodes            = var.bastion_nodes
  zone_id                  = var.zone_id
}
 module "reddis"{
  for_each             = var.elasticache
  source               = "./modules/elasticache"
  server_app_port_cidr = var.backend_subnets
  subnets              = module.vpc.mysql_subnets
   vpc_id              = module.vpc.vpc_id
  component            = each.value["component"]
  env                  = each.value["env"]
  family               = each.value["family"]
  node_type            = each.value["node_type"]
  engine_version       = each.value["engine_version"]
}

module "rds"{
  for_each               = var.rds
  source                 = "./modules/rds"
  component              = "rds"
  env                    = var.env
  vpc_id                 = module.vpc.vpc_id
  rds_app_port           = 3306
  server_app_port_cidr   = var.backend_subnets
  subnet_id              = module.vpc.mysql_subnets
  allocated_storage      = each.value["allocated_storage"]
  db_name                = "mydb"
  engine                 = "mysql"
  engine_version         = each.value["engine_version"]
  instance_class         = each.value["instance_class"]
  storage_type           = each.value["storage_type"]
  family                = each.value["family"]
  kms_key_id            = var.kms_key_id


}

