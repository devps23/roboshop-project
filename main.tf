module "app" {
  source = "./modules/app"
  components = var.components
  instance_type = var.instance_type
  zone_id  = var.zone_id
}
# module "vpc"{
#   source = "./modules/vpc"
#   availability_zone = var.availability_zone
#   backend_subnets = var.backend_subnets
#   default_route_table_id = var.default_route_table_id
#   default_vpc_cidr_block = var.default_vpc_cidr_block
#   default_vpc_id = var.default_vpc_id
#   env = var.env
#   frontend_subnets = var.frontend_subnets
#   mysql_subnets = var.mysql_subnets
#   public_subnets = var.public_subnets
#   vpc_cidr_block = var.vpc_cidr_block
# }
# module "docdb"{
#   source = "./modules/docdb"
#   component = "docdb"
#   env = var.env
#   subnets = module.vpc.mysql_subnets
#   instance_count = 1
#   instance_class = "db.t3.medium"
#   server_app_port_cidr = var.backend_subnets
# }


