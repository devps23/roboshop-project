env = "dev"
instance_type = "t3.micro"
zone_id="Z09583601MY3QCL7AJKBT"
# vault_token="hvs.fMGVYmkvteLqprw3itd1iXUe"
vpc_cidr_block="10.10.0.0/16"
frontend_subnets=["10.10.0.0/19","10.10.32.0/19"]
backend_subnets=["10.10.64.0/19","10.10.96.0/19"]
mysql_subnets=["10.10.128.0/19","10.10.160.0/19"]
public_subnets=["10.10.192.0/19","10.10.224.0/19"]
default_vpc_id = "vpc-02a94ee8944923438"
default_vpc_cidr_block="172.31.0.0/16"
default_route_table_id="rtb-0a2e9ff93585c96fd"
availability_zone = ["us-east-1a","us-east-1b"]
kms_key_id      = "arn:aws:kms:us-east-1:041445559784:key/14862fc0-602f-4084-ae15-5c909d97048d"
bastion_nodes = ["172.31.82.57"]
rabbitmq = {
  main = {
    kms_key_id     = "arn:aws:kms:us-east-1:041445559784:key/14862fc0-602f-4084-ae15-5c909d97048d"
    instance_type   = "t3.micro"
    component       = "rabbitmq"

  }
}
# elasticache = {
#   main = {
#     component      = "redis"
#     env            = "dev"
#     family         = "redis6.x"
#     node_type      = "cache.t4g.micro"
#     engine_version = "6.2"
#   }
# }
docdb = {
  main = {
    kms_key_id     = "arn:aws:kms:us-east-1:041445559784:key/14862fc0-602f-4084-ae15-5c909d97048d"
    engine_version = "4.0.0"
    family  = "docdb4.0"
    component = "docdb"
    instance_class = "db.t3.medium"
  }
}