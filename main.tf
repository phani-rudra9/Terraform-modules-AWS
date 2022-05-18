module "vpc" {
  source      = "./modules/network/vpc"
  vpc         = var.vpc
  environment = var.environment
}

module "igw" {
  source      = "./modules/network/igw"
  igw_name    = var.igw_name
  vpc_id      = module.vpc.vpc_id[0]
  environment = var.environment
}

module "public_subnets" {
  source         = "./modules/network/subnets/public-subnets"
  vpc_id         = module.vpc.vpc_id[0]
  public_subnets = var.public_subnets
  environment    = var.environment
}

module "private_subnets" {
  source          = "./modules/network/subnets/private-subnets"
  vpc_id          = module.vpc.vpc_id[0]
  private_subnets = var.private_subnets
  environment     = var.environment
}

module "nat_gws" {
  source         = "./modules/network/nat"
  environment    = var.environment
  public_subnets = module.public_subnets.public_subnets_id
}

module "public_route_tables" {
  source                     = "./modules/network/routes/public-route-table"
  environment                = var.environment
  internet_gateway_id        = module.igw.igw_id
  public_subnets             = module.public_subnets.public_subnets_id
  public_subnet_route_tables = var.public_subnet_route_tables
  vpc_id                     = module.vpc.vpc_id[0]
}

module "private_route_tables" {
  source                      = "./modules/network/routes/private-route-table"
  environment                 = var.environment
  private_subnets             = module.private_subnets.private_subnets_id
  nat_gw_id                   = module.nat_gws.nat_gw_id
  private_subnet_route_tables = var.private_subnet_route_tables
  vpc_id                      = module.vpc.vpc_id[0]
}

module "public_instances" {
  source          = "./modules/Ec2/public-instances"
  environment     = var.environment
  PublicInstances = var.PublicInstances
  public_sg_id    = module.public_security_group.public_sg_id[0]
  public_subnetid = module.public_subnets.public_subnets_id
}

module "public_security_group" {
  source                      = "./modules/network/security_groups/public-security-groups"
  environment                 = var.environment
  public_security_group_rules = var.public_security_group_rules
  public_security_groups      = var.public_security_groups
  vpc_id                      = module.vpc.vpc_id[0]
}

module "private_instances" {
  source           = "./modules/Ec2/private-instances"
  environment      = var.environment
  PrivateInstances = var.PrivateInstances
  private_sg_id    = module.private_security_group.private_sg_id[1]
  private_subnetid = module.private_subnets.private_subnets_id
}

module "private_security_group" {
  source                       = "./modules/network/security_groups/private-security-groups"
  environment                  = var.environment
  private_security_group_rules = var.private_security_group_rules
  private_security_groups      = var.private_security_groups
  vpc_id                       = module.vpc.vpc_id[0]
  public_sg_src                = module.public_security_group.public_sg_id[0]
}

module "target_groups" {
  source            = "./modules/Ec2/target-groups/target-group"
  tg                = var.tg
  environment       = var.environment
  private_instances = module.private_instances.private_instance_id
  vpc_id            = module.vpc.vpc_id[0]
}

module "lb" {
  source            = "./modules/Ec2/load-balancers/application-lb/alb"
  lbs               = var.lbs
  environment       = var.environment
  subnets           = module.public_subnets.public_subnets_id
  security_group_id = module.public_security_group.public_sg_id[0]

}